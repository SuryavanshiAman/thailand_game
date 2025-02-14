import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/pay_usdt_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/pay_usdt_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class PayUsdtViewModel with ChangeNotifier {
  final _payUsdtRepository = PayUsdtRepo();


  PayUsdtModel? _setProfileData;
  PayUsdtModel? get profileData => _setProfileData;

  setProfile(PayUsdtModel value) {
    _setProfileData = value;
    notifyListeners();
  }

  Future<void> userProfileApi(context) async {
    _payUsdtRepository.payUsdtApi().then((value) {
      if (value.status == 200) {
        setProfile(value);
      } else {
        if (kDebugMode) {
          setProfile(value);

        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('UserProfileViewModel: $error');
      }
    });
  }
}

