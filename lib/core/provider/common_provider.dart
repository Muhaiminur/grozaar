import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:grozaar/core/api/base_api_controller.dart';
import 'package:grozaar/model/category_response.dart';
import 'package:grozaar/model/home_response.dart';
import 'package:grozaar/model/product_details_response.dart';
import 'package:grozaar/model/product_response.dart';
import 'package:grozaar/model/promotion_response.dart';

import '../../model/new_arrival_response_data.dart';
import '../api/api_url.dart';
import '../api/interceptor.dart';
import '../singleton/logger.dart';
import '../utility/customStrings.dart';
import '../utility/progressBar.dart';

class CommonProvider extends BaseApiController with ChangeNotifier {
  ///for api
  bool _isLoading = false;
  String _resMessage = '';
  int _statusCode = 0;
  int _workCode = 0;

  HomeResponse? _homeResponse;

  HomeResponse? get homeResponse => _homeResponse;

  CategoryResponse? _categoryResponse;

  CategoryResponse? get categoryResponse => _categoryResponse;

  CategoryResponse? _subCategoryResponse;

  CategoryResponse? get subCategoryResponse => _subCategoryResponse;

  ProductResponse? _productResponse;

  ProductResponse? get productResponse => _productResponse;

  ProductDetailsResponse? _productDetailsResponse;

  ProductDetailsResponse? get productDetailsResponse => _productDetailsResponse;

  PromotionResponse? _promotionResponse;

  PromotionResponse? get promotionResponse => _promotionResponse;

  NewArrivalResponseData? _newArrivalResponse;

  NewArrivalResponseData? get newArrivalResponse => _newArrivalResponse;

  //Getter
  bool get isLoading => _isLoading;

  String get resMessage => _resMessage;

  int get statusCode => _statusCode;

  int get workCode => _workCode;

  Future<int> homePageCall() async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(ApiUrl.homepageUrl);
      _homeResponse = HomeResponse.fromJson(response.data);
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

  Future<int> categoryCall() async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(ApiUrl.categoryUrl);
      _categoryResponse = CategoryResponse.fromJson(response.data);
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

  Future<int> subCategoryCall(String id) async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(
        "${ApiUrl.subCategoryUrl}$id/sub-categories?page=1&per_page=50",
      );
      _subCategoryResponse = CategoryResponse.fromJson(response.data);
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

  Future<int> categoryProductCall(
    String catId,
    String page,
    String parPage,
    String brandId,
  ) async {
    try {
      Map<String, dynamic> map = {};
      if (brandId.isNotEmpty) {
        map['brand_id'] = brandId;
      }
      if (catId.isNotEmpty) {
        map['category_id'] = catId;
      }
      if (page.isNotEmpty) {
        map['page'] = page;
      }
      if (parPage.isNotEmpty) {
        map['parPage'] = parPage;
      }
      final response = await getDio()!.get(
        ApiUrl.categoryProductUrl,
        queryParameters: map,
      );
      _productResponse = ProductResponse.fromJson(response.data);
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
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> searchProductCall(
    String product,
    String page,
    String parPage,
  ) async {
    try {
      final response = await getDio()!.get(
        ApiUrl.categoryProductUrl,
        queryParameters: {"search": product, "page": page, "parPage": parPage},
      );
      _productResponse = ProductResponse.fromJson(response.data);
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
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> newArrivalProductCall(String page, String parPage) async {
    try {
      Future.delayed(Duration.zero, () async {
        CustomProgressDialog.show(message: "Loading", isDismissible: false);
      });
      final response = await getDio()!.get(
        ApiUrl.newArrivalUrl,
        queryParameters: {"page": page, "parPage": parPage},
      );
      _productResponse = ProductResponse.fromJson(response.data);
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
      CustomProgressDialog.hide();
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> bestSellProductCall(String page, String parPage) async {
    try {
      Future.delayed(Duration.zero, () async {
        CustomProgressDialog.show(message: "Loading", isDismissible: false);
      });
      final response = await getDio()!.get(
        ApiUrl.bestSellingUrl,
        queryParameters: {"page": page, "parPage": parPage},
      );
      _productResponse = ProductResponse.fromJson(response.data);
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
      CustomProgressDialog.hide();
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> productDetailsCall(String id) async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(ApiUrl.productDetailsUrl + id);
      _productDetailsResponse = ProductDetailsResponse.fromJson(response.data);
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
      CustomProgressDialog.hide();
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> promotionCall() async {
    Future.delayed(Duration.zero, () async {
      CustomProgressDialog.show(message: "Loading", isDismissible: false);
    });
    try {
      final response = await getDio()!.get(ApiUrl.promotionUrl);
      _promotionResponse = PromotionResponse.fromJson(response.data);
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
      CustomProgressDialog.hide();
      _isLoading = false;
      notifyListeners(); // Notify listeners that the data has changed
    }
  }

  Future<int> newArrivalCall(String page, String parPage) async {
    try {
      final response = await getDio()!.get(
        ApiUrl.newArrivalUrl,
        queryParameters: {
          "page": page,
          "parPage": parPage,
          "new_arrival_days": "120",
        },
      );
      // _newArrivalResponse = NewArrivalResponseData.fromJson(response.data);
      if (response.statusCode == 200) {
        NewArrivalResponseData? allFarmResponse2 =
            NewArrivalResponseData.fromJson(response.data);
        if (page == "1" || page == "0") {
          _newArrivalResponse = NewArrivalResponseData.fromJson(response.data);
          _newArrivalResponse?.data!.data!.clear();
          _newArrivalResponse?.data!.data!.addAll(allFarmResponse2.data!.data!);
          _newArrivalResponse?.data!.links!.next =
              allFarmResponse2.data!.links!.next;
        } else {
          _newArrivalResponse?.data!.data!.addAll(allFarmResponse2.data!.data!);
          _newArrivalResponse?.data!.links!.next =
              allFarmResponse2.data!.links!.next;
        }
      } else {
        Log().showMessageToast(message: CustomStrings().tryAgainLater);
      }
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
      _isLoading = false;
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
