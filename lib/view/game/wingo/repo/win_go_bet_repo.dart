import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/view/game/wingo/res/win_go_api_url.dart';

class WinGoBetRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> wingoBet(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(WinGoApiUrl.wingoBet, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during wingoBet: $e');
      }
      rethrow;
    }
  }
}
