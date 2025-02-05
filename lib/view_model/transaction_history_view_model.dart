import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/model/transaction_history_model.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/repo/transaction_history_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class TransactionHistoryViewModel with ChangeNotifier {
  final _transactionRepo = TransactionHistoryRepo();



  TransactionHistoryModel? _transactionData;
  TransactionHistoryModel? get transactionData => _transactionData;

  setTransactionHistory(TransactionHistoryModel value) {
    _transactionData = value;
    notifyListeners();
  }

  Future<void> transactionApi(dynamic id , dynamic date,context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data={
      "userid": userId,
      "type_id": id,
      "date": date
    };
    print(data);
    _transactionRepo.transactionApi(data).then((value) {
      if (value.status == 200) {
        setTransactionHistory(value);
      } else {
        setTransactionHistory(value);
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('transactionApi: $error');
      }
    });
  }
}

