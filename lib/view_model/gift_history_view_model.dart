import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/gift_history_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/gift_history_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class GiftHistoryViewModel with ChangeNotifier {
  final _giftHistoryRepo = GiftHistoryRepo();

  GiftHistoryModel? _giftHistoryData;
  GiftHistoryModel? get giftHistoryData => _giftHistoryData;

  setGiftHistory(GiftHistoryModel value) {
    _giftHistoryData = value;
    notifyListeners();
  }

  Future<void> giftHistoryApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _giftHistoryRepo.giftHistoryApi(userId).then((value) {
      if (value.status == 200) {
        setGiftHistory(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('giftHistoryApi: $error');
      }
    });
  }
}

