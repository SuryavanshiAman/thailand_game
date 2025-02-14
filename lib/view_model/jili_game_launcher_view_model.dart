// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:game/repo/jili_game_launchere_repo.dart';
// import 'package:game/res/color-const.dart';
// import 'package:game/utils/routes/routes_name.dart';
// import 'package:game/utils/utils.dart';
// import 'package:game/view_model/user_view_model.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class JiliGameLauncherViewModel with ChangeNotifier {
//   final _jiliGameRepo = JiliGameLaunchereRepo();
//
//   bool _loading = false;
//
//   bool get loading => _loading;
//
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> jiligame(dynamic gameId, context) async {
//     UserViewModel userViewModal = UserViewModel();
//     String? userId = await userViewModal.getUser();
//     setLoading(true);
//     Map data={
//       "user_id" : userId,
//       "game_id" : gameId
//     };
//     _jiliGameRepo.jiligame(data).then((value) {
//       if (value['status'] == 200) {
//         setLoading(false);
//         print("aman:${value['game_url']}");
//         launchURL(value['game_url']);
//       }
//       else {
//         setLoading(false);
//         Utils.setSnackBar(value['message'], AppColor.red, context);
//       }
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print('editPasswordApi: $error');
//       }
//     });
//   }
//   // static void launchURL(String url) async {
//   //   print("www$url");
//   //   if (await canLaunchUrl(Uri.parse(url))) {
//   //     await launchUrl(Uri.parse(url));
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
//   static Future<void> launchURL(String url) async {
//     Uri uri = Uri.parse(url);
//
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       print("Could not launch $url");
//     }
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/repo/jili_game_launchere_repo.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/update_jili_wallet_view_model.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class JiliGameLauncherViewModel with ChangeNotifier {
  final _jiliGameRepo = JiliGameLaunchereRepo();
  bool _loading = false;
  bool _isGameLaunched = false;

  bool get isGameLaunched => _isGameLaunched;

  setIsGameLaunched(bool value) {
    _isGameLaunched = value;
    notifyListeners();
  }

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> jiligame(dynamic gameId, BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    setLoading(true);

    Map<String, dynamic> data = {
      "user_id": userId,
      "game_id": gameId,
    };

    try {
      final value = await _jiliGameRepo.jiligame(data);
      if (value['status'] == 200) {
        setLoading(false);
        String gameUrl = value['game_url'];
        debugPrint("Game URL: $gameUrl");
        Provider.of<UpdateJiliWalletViewModel>(context,listen: false).updateJiliWallletApi(context);
        launchURL(gameUrl);
      } else {
        setLoading(false);
        Utils.setSnackBar(value['message'], AppColor.red, context);
      }
    } catch (error) {
      setLoading(false);
      debugPrint('Error launching game: $error');
    }
  }

  static Future<void> launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("Trying to launch: $uri");

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch: $uri");
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }
}
