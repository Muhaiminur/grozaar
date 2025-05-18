import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:grozaar/core/api/base_api_controller.dart';

import '../../model/user_response.dart';
import '../api/api_url.dart';
import '../singleton/logger.dart';
import '../utility/progressBar.dart';

class AuthProvider extends BaseApiController with ChangeNotifier {
  ///for api
  bool _isLoading = false;
  String _resMessage = '';
  int _statusCode = 0;
  int _workCode = 0;

  UserResponse _logInResponse = UserResponse();

  UserResponse get logInResponse => _logInResponse;

  //Getter
  bool get isLoading => _isLoading;

  String get resMessage => _resMessage;

  int get statusCode => _statusCode;

  int get workCode => _workCode;

  Future registrationCall({
    required String type,
    required String name,
    required String email,
    required String username,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String manPhone,
  }) async {
    CustomProgressDialog.show(message: "Loading...", isDismissible: false);
    try {
      final response = await getDio()!.post(
        ApiUrl.signUpUrl,
        data: {
          'type': type,
          'name': name,
          'email': email,
          'username': username,
          'password': password,
          'manager_phone': manPhone,
          'password_confirmation': passwordConfirmation,
          'phone': phone,
        },
      );
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.toString());
        _resMessage = responseJson["message"];
        _isLoading = true;
      } else {
        final responseJson = json.decode(response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      }
      notifyListeners();
    } on DioException catch (e) {
      _resMessage = '';
      final responseJson = json.decode(e.response.toString());
      Log().showMessageToast(message: responseJson["message"]);
    } finally {
      //_isLoading = false; // Set loading flag to false
      CustomProgressDialog.hide();
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> signInCall({
    required String username,
    required String password,
  }) async {
    CustomProgressDialog.show(message: "Loading...", isDismissible: false);
    try {
      final response = await getDio()!.post(
        ApiUrl.signInUrl,
        data: {'login': username, 'password': password},
      );
      if (response.statusCode == 200) {
        _logInResponse = UserResponse.fromJson(response.data);
      } else {
        final responseJson = json.decode(response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      }
      notifyListeners();
      return response.statusCode!;
    } on DioException catch (e) {
      _resMessage = '';
      final responseJson = json.decode(e.response.toString());
      Log().showMessageToast(message: responseJson["message"]);
      return e.response!.statusCode!;
    } finally {
      _isLoading = false; // Set loading flag to false
      CustomProgressDialog.hide();
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  void clear() {
    _resMessage = "";
    _isLoading = false;
    _statusCode = 0;
    _workCode = 0;
    notifyListeners();
  }
}
