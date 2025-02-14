import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/model/deposit_model.dart';
import 'package:game/repo/deposit_history_repo.dart';
import 'package:game/view_model/user_view_model.dart';

class DepositHistoryViewModel with ChangeNotifier {
  final _depositHistoryRepo = DepositHistoryRepo();


  DepositModel? _depositHistoryData;
  DepositModel? get depositHistoryData => _depositHistoryData;

  setDepositHistory(DepositModel value) {
    _depositHistoryData = value;
    notifyListeners();
  }

  Future<void> depositHistoryApi(dynamic type, dynamic status, dynamic date ,context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data={
      "userid": userId,
      "type":type,
      "status":status,
      "date": date.toString()
    };
    print(data);
    _depositHistoryRepo.depositHistoryApi(data).then((value) {
      if (value.status == 200) {
        setDepositHistory(value);
      } else {
        setDepositHistory(value);
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('depositHistoryApi: $error');
      }
    });
  }
}

