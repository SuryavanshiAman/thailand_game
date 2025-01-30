import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../repo/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> authApi(dynamic data, context) async {
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    setLoading(true);
    print(data);
    _authRepo.authApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        userPref.saveUser(value['user_id'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.setSnackBar(value['message'], context);
      }
      else {
        setLoading(false);
        Utils.setSnackBar(value['message'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('loginApiError: $error');
      }
    });
  }

  Future<void> registerApi(dynamic data, context) async {
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    setLoading(true);
    _authRepo.registerApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        userPref.saveUser(value['user_id'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.setSnackBar(value['message'], context);
      }
      else {
        setLoading(false);
        Utils.setSnackBar(value['message'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('registerApi: $error');
      }
    });
  }


}