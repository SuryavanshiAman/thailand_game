
import 'package:flutter/foundation.dart';
import 'package:game/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class GiftCardRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> giftCardApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.giftCardsApi, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during giftCardApi: $e');
      }
      rethrow;
    }
  }}