import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/model/view_bank_model.dart';
import 'package:game/res/api_url.dart';

class ViewBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ViewBankModel> viewBankApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.viewBankApi}$data");
      return ViewBankModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during viewBankApi: $e');
      }
      rethrow;
    }
  }

}