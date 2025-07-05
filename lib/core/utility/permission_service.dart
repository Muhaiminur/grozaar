import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionService {
  /// Static method to check and request the specified permission.
  /// Handles platform-specific differences for Android and iOS.
  static Future<bool> checkPermission({required String permissionName}) async {
    bool granted = false;

    try {
      Permission permission;

      // Map permission name to actual Permission object
      switch (permissionName) {
        case 'notification':
          permission = Permission.notification;
          break;
        case 'storage':
          permission = Platform.isAndroid
              ? (await _isAndroid13OrHigher()
                  ? Permission.photos
                  : Permission.storage)
              : Permission.photos; // Use Photos for iOS
          break;
        case 'camera':
          permission = Permission.camera;
          break;
        case 'gallery':
          permission = Platform.isAndroid
              ? (await _isAndroid13OrHigher()
                  ? Permission.photos
                  : Permission.storage)
              : Permission.photos;
          break;
        default:
          throw Exception("Unknown permission: $permissionName");
      }

      // Check initial permission status
      var status = await permission.status;

      if (status.isGranted) {
        granted = true; // Permission already granted
      } else if (status.isDenied) {
        // Permission is denied but can be requested
        var result = await permission.request();
        granted = result.isGranted;
      } else if (status.isPermanentlyDenied) {
        // Permission is permanently denied
        granted = false;
        openAppSettings(); // Suggest opening app settings
      } else if (status.isRestricted) {
        // Restricted permission (e.g., parental controls)
        granted = false;
      }
    } catch (e) {
      print("Error checking permission ($permissionName): $e");
    }

    return granted;
  }

  /// Helper method to check if the device is running Android 13 or higher.
  static Future<bool> _isAndroid13OrHigher() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt >= 33;
    }
    return false;
  }
}
