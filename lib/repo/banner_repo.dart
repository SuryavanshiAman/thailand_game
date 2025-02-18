import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/model/banner_model.dart';

import '../res/api_url.dart';

class BannerRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<BannerModel> bannerApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.bannerApi);
      return BannerModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during bannerApi: $e');
      }
      rethrow;
    }
  }
}