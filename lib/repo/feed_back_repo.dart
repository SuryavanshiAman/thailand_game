
import 'package:flutter/foundation.dart';
import 'package:game/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class FeedBackRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> feedBackApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.editPasswordApi, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during feedBackApi: $e');
      }
      rethrow;
    }
  }}