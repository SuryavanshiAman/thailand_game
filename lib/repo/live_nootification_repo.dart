import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/live_notification_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/res/api_url.dart';

class LiveNotificationRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<LiveNotificationModel> liveNotificationApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.liveNotificationApi);
      return LiveNotificationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during liveNotificationApi: $e');
      }
      rethrow;
    }
  }

}