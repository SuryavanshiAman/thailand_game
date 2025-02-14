import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/usdt_bank_address_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class UsdtBankViewModel with ChangeNotifier {
  final _usdtBankRepo = UsdtBankRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> usdtBankApi(dynamic name,dynamic address, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "userid" : userId,
      "name" : name,
      "usdt_address" : address
    };
    _usdtBankRepo.usdtBankApi(data).then((value) {
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
        print('usdtBankApi: $error');
      }
    });
  }
}