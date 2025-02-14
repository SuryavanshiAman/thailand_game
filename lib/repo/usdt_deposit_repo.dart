
import 'package:flutter/foundation.dart';
import 'package:game/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class UsdtDepositRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> usdtDepositApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.usdtDepositApi, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during usdtDepositApi: $e');
      }
      rethrow;
    }
  }}