import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/notification_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/notification_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class NotificationViewModel with ChangeNotifier {

  final _notificationRepo = NotificationRepo();

  NotificationModel? _notificationData;
  NotificationModel? get notificationData => _notificationData;

  setNotification(NotificationModel value) {
    _notificationData = value;
    notifyListeners();
  }

  Future<void> notificationApi(context) async {
    _notificationRepo.notificationApi().then((value) {
      if (value.status == 200) {
        setNotification(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('notificationApi: $error');
      }
    });
  }
}

