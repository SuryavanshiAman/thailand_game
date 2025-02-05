import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/transaction_history_model.dart';
import 'package:game/res/api_url.dart';

class TransactionHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TransactionHistoryModel> transactionApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.transactionApi,data);
      return TransactionHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during transactionApi: $e');
      }
      rethrow;
    }
  }

}