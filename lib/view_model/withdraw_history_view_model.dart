import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/repo/withdraw_history_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class WithdrawHistoryViewModel with ChangeNotifier {
  final _withdrawHistoryRepo = WithdrawHistoryRepo();


  ProfileModel? _withdrawHistoryData;
  ProfileModel? get withdrawHistoryData => _withdrawHistoryData;

  setWithdrawHistory(ProfileModel value) {
    _withdrawHistoryData = value;
    notifyListeners();
  }

  Future<void> withdrawHistoryApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _withdrawHistoryRepo.withdrawHistoryApi(userId).then((value) {
      if (value.status == 200) {
        setWithdrawHistory(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('withdrawHistoryApi: $error');
      }
    });
  }
}

