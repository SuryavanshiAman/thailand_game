import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/model/all_game_list_model.dart';
import 'package:game/model/profile_model.dart';
import 'package:game/repo/all_game_list_repo.dart';
import 'package:game/repo/profile_repo.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class AllGameListViewModel with ChangeNotifier {
  final _allGameList = AllGameListRepo();

  AllGameListModel? _allGameData;
  AllGameListModel? get allGameData => _allGameData;

  setAllGame(AllGameListModel value) {
    _allGameData = value;
    notifyListeners();
  }

  Future<void> allGameListApi(context) async {
    _allGameList.allGameListApi().then((value) {
      if (value.status == 200) {
        setAllGame(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('UserProfileViewModel: $error');
      }
    });
  }
}

