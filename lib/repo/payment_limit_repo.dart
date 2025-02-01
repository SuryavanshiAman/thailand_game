import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/palyment_limit_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/res/api_url.dart';

class PaymentLimitRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PaymentLimitsModel> paymentLimitApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.paymentLimitApi);
      return PaymentLimitsModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during paymentLimitApi: $e');
      }
      rethrow;
    }
  }

}