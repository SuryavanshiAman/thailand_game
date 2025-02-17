import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/live_notification_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/live_nootification_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class LiveNotificationViewModel with ChangeNotifier {
  final _live = LiveNotificationRepo();


  LiveNotificationModel? _setProfileData;
  LiveNotificationModel? get profileData => _setProfileData;

  setProfile(LiveNotificationModel value) {
    _setProfileData = value;
    notifyListeners();
  }

  Future<void> liveNotificationApi(context) async {
    _live.liveNotificationApi().then((value) {
      if (value.status == 200) {
        setProfile(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('liveNotificationApi: $error');
      }
    });
  }
}

