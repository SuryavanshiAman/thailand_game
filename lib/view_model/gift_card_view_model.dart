import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/gift_card_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';

class GiftCardViewModel with ChangeNotifier {
  final _giftCardRepo = GiftCardRepo();

  bool _loading = false;

  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> giftCardApi(dynamic code, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoading(true);
    Map data={
      "id":userId,
      "code":code
    };
    _giftCardRepo.giftCardApi(data).then((value) {
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
        print('editPasswordApi: $error');
      }
    });
  }
}