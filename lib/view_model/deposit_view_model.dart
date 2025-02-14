import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/repo/deposit_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class DepositViewModel with ChangeNotifier{
  final List<Map<String, dynamic>> paymentOptions = [
    // {
    //   'title': 'UPI-QRpay',
    //   'image': Assets.imagesUip,
    //   'bgColor': Colors.black,
    // },
    // {
    //   'title': 'Wake UP-APP',
    //   'image': Assets.imagesUpApp,
    //   'bgColor': Colors.black,
    // },
    // {
    //   'title': 'UPI-PayTM',
    //   'image': Assets.imagesUpiPaytm,
    //   'bgColor': Colors.amberAccent,
    // },
    {
      'title': 'USDT',
      'image': Assets.imagesUsdt,
      'bgColor': Colors.black,
      'badge': '+2%',
    },
  ];
  List<String>transactionType=[
    "All",
    "To be Paid",
    "Complete",
    "Failed",
  ];
  List<String>withdrawType=[
    "All",
    "Processing",
    "Complete",
    "Rejected",
  ];
  final List<Map<String, String>> transactionsHistory = [
    {
      "balance": "🪙200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "202501281221572681"
    },
    {
      "balance": "🪙200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "🪙200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "🪙200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "🪙200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    }
  ];
  final _depositRepo = DepositRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> depositApi(dynamic amount, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "id":userId,
      "amount":amount,
    };
    _depositRepo.depositApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.setSnackBar(value['message'], AppColor.green, context);
      }
      else {
        setLoading(false);
        Utils.setSnackBar(value['message'], AppColor.red, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('withdrawApi: $error');
      }
    });
  }
}
