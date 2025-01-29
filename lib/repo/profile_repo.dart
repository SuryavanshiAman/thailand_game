import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/view/game/Aviator/res/api_url.dart';
import 'package:game/view/game/wingo/res/win_go_api_url.dart';

class UserProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileModel> userProfileApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.profile + data);
      return ProfileModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during userProfileApi: $e');
      }
      rethrow;
    }
  }

}