
import 'package:flutter/foundation.dart';
import 'package:game/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class UpdateProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> updateApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.updateProfileApi,data );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during updateApi: $e');
      }
      rethrow;
    }
  }}