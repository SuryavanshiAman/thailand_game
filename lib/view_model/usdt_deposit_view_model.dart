import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/repo/deposit_repo.dart';
import 'package:game/repo/usdt_deposit_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class UsdtDepositViewModel with ChangeNotifier{
  final _usdtDepositRepo = UsdtDepositRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> usdtDpositApi(dynamic amount, dynamic usdt,dynamic image, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "userid": userId,
      "amount":amount,
      "usdt_amount":usdt,
      "screenshot":image

    };
    print("TTTTT:$data");
    _usdtDepositRepo.usdtDepositApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.depositScreen);
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
