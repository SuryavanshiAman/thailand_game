import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/usdt_view_bank_model.dart';
import 'package:game/model/view_bank_model.dart';
import 'package:game/res/api_url.dart';

class USdtViewBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<UsdtViewBankModel> usdtViewBankApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.viewUserUsdtAddressApi}$data");
      return UsdtViewBankModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during usdtViewBankApi: $e');
      }
      rethrow;
    }
  }

}