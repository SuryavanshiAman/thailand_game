
import 'package:flutter/foundation.dart';
import 'package:game/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class UsdtBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> usdtBankApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.usdtAddBankApi, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during usdtBankApi: $e');
      }
      rethrow;
    }
  }
}