import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/aboutus_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/aboutus_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class AboutUsViewModel with ChangeNotifier {
  final _aboutUsRepository = AboutUsRepository();


  AboutUSModel? _setAboutUsData;
  AboutUSModel? get aboutUsData => _setAboutUsData;

  setProfile(AboutUSModel value) {
    _setAboutUsData = value;
    notifyListeners();
  }

  Future<void> aboutUsApi(dynamic data,context) async {
    _aboutUsRepository.aboutUsApi(data).then((value) {
      if (value.status == 200) {
        setProfile(value);
        if (data=="1"){
          Navigator.pushNamed(context, RoutesName.commonAboutPage,arguments: {
            "name":"Confidentiality Agreement"
          });
        }else{
          Navigator.pushNamed(context, RoutesName.commonAboutPage,arguments: {
            "name":"Risk Disclosure Agreement"
          });
        }

      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('aboutUsApi: $error');
      }
    });
  }
}

