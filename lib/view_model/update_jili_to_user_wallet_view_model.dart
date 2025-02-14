import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/update_jili_wallet_repo.dart';
import 'package:game/repo/update_jilli_to_user_wallet_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class UpdateJiliToUserWalletViewModel with ChangeNotifier {
  final _updateJiliToUserWalletRepo = UpdateJilliToUserWalletRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> updateJilliToUserWalletApi( context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "user_id":userId,
    };
    _updateJiliToUserWalletRepo.updateJilliToUserWalletApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Utils.setSnackBar(value['message'], AppColor.green, context);
      }
      else {
        setLoading(false);
        Utils.setSnackBar(value['message'], AppColor.red, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('updateJilliToUserWalletApi: $error');
      }
    });
  }
}