import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:grozaar/core/api/base_api_controller.dart';
import 'package:grozaar/model/cart_response.dart';

import '../api/api_url.dart';
import '../api/interceptor.dart';
import '../singleton/logger.dart';
import '../utility/progressBar.dart';

class CartProvider extends BaseApiController with ChangeNotifier {
  ///for api
  bool _isLoading = false;
  String _resMessage = '';
  int _statusCode = 0;
  int _workCode = 0;

  CartResponse? _cartResponse;

  CartResponse? get cartResponse => _cartResponse;

  //Getter
  bool get isLoading => _isLoading;

  String get resMessage => _resMessage;

  int get statusCode => _statusCode;

  int get workCode => _workCode;

  Future<int> addToCart(String id, String quantity) async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.post(
        ApiUrl.cartAddUrl,
        data: {"product_id": id, "quantity": quantity},
      );
      notifyListeners();
      final responseJson = json.decode(response.toString());
      Log().showMessageToast(message: responseJson["message"]);
      return response.statusCode!;
    } on DioException catch (e) {
      try {
        _resMessage = e.toString();
        Log().printError(_resMessage);
        final responseJson = json.decode(e.response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      } on Exception catch (_) {
        Log().showMessageToast(message: AppInterceptors.handleError(e));
        rethrow;
      }
      notifyListeners();
      return e.response!.statusCode!;
    } finally {
      _isLoading = false; // Set loading flag to false
      CustomProgressDialog.hide();
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> removeToCart(String id, String quantity) async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.post(
        ApiUrl.cartDeductUrl,
        data: {"product_id": id, "quantity": quantity},
      );
      notifyListeners();
      final responseJson = json.decode(response.toString());
      Log().showMessageToast(message: responseJson["message"]);
      return response.statusCode!;
    } on DioException catch (e) {
      try {
        _resMessage = e.toString();
        Log().printError(_resMessage);
        final responseJson = json.decode(e.response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      } on Exception catch (_) {
        Log().showMessageToast(message: AppInterceptors.handleError(e));
        rethrow;
      }
      notifyListeners();
      return e.response!.statusCode!;
    } finally {
      _isLoading = false; // Set loading flag to false
      CustomProgressDialog.hide();
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> deleteToCart(String id) async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.delete(
        "${ApiUrl.cartUrl}/$id${ApiUrl.cartDeleteUrl}",
      );
      notifyListeners();
      final responseJson = json.decode(response.toString());
      Log().showMessageToast(message: responseJson["message"]);
      return response.statusCode!;
    } on DioException catch (e) {
      try {
        _resMessage = e.toString();
        Log().printError(_resMessage);
        final responseJson = json.decode(e.response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      } on Exception catch (_) {
        Log().showMessageToast(message: AppInterceptors.handleError(e));
        rethrow;
      }
      notifyListeners();
      return e.response!.statusCode!;
    } finally {
      _isLoading = false; // Set loading flag to false
      CustomProgressDialog.hide();
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> showCart() async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(ApiUrl.cartUrl);
      _cartResponse = CartResponse.fromJson(response.data);
      notifyListeners();
      return response.statusCode!;
    } on DioException catch (e) {
      try {
        _resMessage = e.toString();
        Log().printError(_resMessage);
        final responseJson = json.decode(e.response.toString());
        Log().showMessageToast(message: responseJson["message"]);
      } on Exception catch (_) {
        Log().showMessageToast(message: AppInterceptors.handleError(e));
        rethrow;
      }
      notifyListeners();
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
