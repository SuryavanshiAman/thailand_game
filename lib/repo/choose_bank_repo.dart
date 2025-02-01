import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/choose_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/res/api_url.dart';

class ChooseBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ChooseBankModel> chooseBankApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.bankNameApi);
      return ChooseBankModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during chooseBankApi: $e');
      }
      rethrow;
    }
  }

}