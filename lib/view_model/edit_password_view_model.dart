import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/edit_password_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class EditPasswordViewModel with ChangeNotifier {
  final _editPasswordRepo = EditPasswordRepository();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> editPasswordApi(dynamic password,dynamic newPassword,dynamic confirmPassword, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "id":userId,
      "login_password":password,
      "new_password":newPassword,
      "confirm_password":confirmPassword
    };
    _editPasswordRepo.editPasswordApi(data).then((value) {
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