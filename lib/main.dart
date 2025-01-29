import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/res/app_constant.dart';
import 'package:game/test.dart';
import 'package:game/view/auth/splash_screen.dart';
import 'package:game/view/bottom_bar/bottom_bar_cubit.dart';
import 'package:game/view/game/wingo/controller/win_go_controller.dart';
import 'package:game/view/game/wingo/view_model/win_go_bet_view_model.dart';
import 'package:game/view/game/wingo/view_model/win_go_pop_up_view_model.dart';
import 'package:game/view/game/wingo/view_model/win_go_result_view_model.dart';
import 'package:game/view_model/deposit_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view/game/wingo/view_model/win_go_game_his_view_model.dart';
import 'view/game/wingo/view_model/win_go_my_his_view_model.dart';
import 'view_model/game_view_model.dart';
import 'view_model/withdraw_view_model.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=kIsWeb?400:MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WinGoController()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoGameHisViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoMyHisViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoPopUpViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoBetViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoResultViewModel()),
        ChangeNotifierProvider(create: (context) => DepositViewModel()),
        ChangeNotifierProvider(create: (context) => WithdrawViewModel()),
        ChangeNotifierProvider(create: (context) => GameViewModel()),
      ],
      child: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: width
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title:AppConstants.appName,
            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: (settings) {
              if (settings.name != null) {
                return MaterialPageRoute(
                  builder: Routers.generateRoute(settings.name!),
                  settings: settings,
                );
              }
              return null;
            },
            // home:  CategoryPage(),
          ),
        ),
      ),
    );
  }
}
double height=0.0;
double width=0.0;
