import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/pay_usdt_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/res/api_url.dart';

class PayUsdtRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PayUsdtModel> payUsdtApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.payUsdtApi);
      return PayUsdtModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during payUsdtApi: $e');
      }
      rethrow;
    }
  }

}