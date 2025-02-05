import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/model/withdraw_history_model.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/repo/withdraw_history_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class WithdrawHistoryViewModel with ChangeNotifier {
  final List<Map<String, dynamic>> paymentOptions = [
    {
      'title': 'All',
      'image': Assets.imagesAll,
      'bgColor': Colors.black,
    },
    {
      'title': 'Bank Card',
      'image': Assets.imagesBankCard,
      'bgColor': Colors.black,
    },
    {
      'title': 'USDT',
      'image': Assets.imagesUsdt,
      'bgColor': Colors.black,
      'badge': '+2%',
    },
  ];
  final List<Map<String, String>> transactionsHistory = [
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "202501281221572681"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    }
  ];
  final _withdrawHistoryRepo = WithdrawHistoryRepo();


  WithdrawHistoryModel? _withdrawHistoryData;
  WithdrawHistoryModel? get withdrawHistoryData => _withdrawHistoryData;

  setWithdrawHistory(WithdrawHistoryModel value) {
    _withdrawHistoryData = value;
    notifyListeners();
  }

  Future<void> withdrawHistoryApi(dynamic type, dynamic status, dynamic date ,context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data={
      "userid": userId,
      "type":type,
      "status":status,
      "date": date.toString()
    };
    print(data);
    _withdrawHistoryRepo.withdrawHistoryApi(data).then((value) {
      if (value.status == 200) {
        setWithdrawHistory(value);
      } else {
        setWithdrawHistory(value);
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('withdrawHistoryApi: $error');
      }
    });
  }
}

