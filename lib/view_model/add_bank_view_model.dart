import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/add_bank_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class AddBankViewModel with ChangeNotifier {
  final _addBankRepo = AddBankRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> addBankApi(dynamic bankName,dynamic name,dynamic accountNumber,dynamic phone,dynamic mail,dynamic ifsc, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "userid":userId,
      "bankname": bankName,
      "holdername": name,
      "accountnum": accountNumber,
      "phone": phone,
      "mail":mail,
      "ifsc": ifsc
    };
    _addBankRepo.addBankApi(data).then((value) {
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
        print('editPasswordApi: $error');
      }
    });
  }
}