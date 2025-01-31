import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/aboutus_model.dart';
import 'package:game/res/api_url.dart';

class AboutUsRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AboutUSModel> aboutUsApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.aboutUsApi}$data");
      return AboutUSModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during aboutUsApi: $e');
      }
      rethrow;
    }
  }

}