import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/res/api_url.dart';

class DepositHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileModel> withdrawHistoryApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.withdrawHistoryApi}$data");
      return ProfileModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during withdrawHistoryApi: $e');
      }
      rethrow;
    }
  }

}