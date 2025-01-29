import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/view/game/wingo/model/win_go_game_his_model.dart';
import 'package:game/view/game/wingo/res/win_go_api_url.dart';
class WinGoGameHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinGoGameHisModel> gameHisApi(context, dynamic gameId,dynamic offset) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${WinGoApiUrl.winGoGameHis}$gameId&offset=$offset");
      return WinGoGameHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during gameHisApi: $e');
      }
      rethrow;
    }
  }
}
