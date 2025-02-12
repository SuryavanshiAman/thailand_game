import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/model/withdraw_history_model.dart';
import 'package:game/res/api_url.dart';

class WithdrawHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<WithdrawHistoryModel> withdrawHistoryApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          ApiUrl.withdrawHistoryApi,data);
      return WithdrawHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during withdrawHistoryApi: $e');
      }
      rethrow;
    }
  }

}