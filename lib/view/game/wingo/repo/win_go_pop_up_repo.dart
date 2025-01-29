import 'package:flutter/foundation.dart';
import 'package:game/helper/network/base_api_services.dart';
import 'package:game/helper/network/network_api_services.dart';
import 'package:game/view/game/wingo/model/win_amount_model.dart';
import 'package:game/view/game/wingo/res/win_go_api_url.dart';
class WinGoPopUpRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinAmountModel> winAmountApi(
      dynamic userId, String gameId, dynamic period) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${WinGoApiUrl.wingoWinAmount}$userId&game_id=$gameId&games_no=$period");
      print(WinGoApiUrl.wingoWinAmount);
      print("${WinGoApiUrl.wingoWinAmount}$userId&game_id=$gameId&games_no=$period");
      return WinAmountModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during winAmountApi: $e');
      }
      rethrow;
    }
  }
}
