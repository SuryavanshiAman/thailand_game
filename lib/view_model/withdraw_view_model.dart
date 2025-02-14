import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/repo/withdraw_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';


class WithdrawViewModel with ChangeNotifier{
  final List<Map<String, dynamic>> withdrawOptions = [
    // {
    //   'title': 'BANK CARD',
    //   'image': Assets.imagesBankCard,
    //   'bgColor': Colors.black,
    // },
    {
      'title': 'USDT',
      'image': Assets.imagesUsdt,
      'bgColor': Colors.black,
      'badge': '+2%',
    },
  ];
  final _withdrawRepo = WithdrawRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> withdrawApi(dynamic amount,dynamic usdtAmount, dynamic type,dynamic id, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "userid": userId,
      "amount": amount,
      "usdt_amount":usdtAmount,
      "type": type,
      "id":id
    };
    print(data);
    _withdrawRepo.withdrawApi(data).then((value) {
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