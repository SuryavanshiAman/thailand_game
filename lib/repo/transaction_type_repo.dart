import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/model/transaction_model.dart';
import 'package:game/res/api_url.dart';

class TransactionTypeRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TransactionTypeModel> transactionTypeApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
         ApiUrl.transactionType);
      return TransactionTypeModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during transactionTypeApi: $e');
      }
      rethrow;
    }
  }

}