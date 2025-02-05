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
import 'package:game/view_model/auth_view_model.dart';
import 'package:game/view_model/avtar_view_model.dart';
import 'package:game/view_model/deposit_view_model.dart';
import 'package:game/view_model/gift_card_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view/game/wingo/view_model/win_go_game_his_view_model.dart';
import 'view/game/wingo/view_model/win_go_my_his_view_model.dart';
import 'view_model/aboutus_view_model.dart';
import 'view_model/add_bank_view_model.dart';
import 'view_model/choose_bank_view_model.dart';
import 'view_model/edit_password_view_model.dart';
import 'view_model/feed_back_view_model.dart';
import 'view_model/game_view_model.dart';
import 'view_model/gift_history_view_model.dart';
import 'view_model/main_wallet_transfer_view_model.dart';
import 'view_model/notification_view_model.dart';
import 'view_model/payment_limit_view_model.dart';
import 'view_model/services/splash_services.dart';
import 'view_model/transaction_history_view_model.dart';
import 'view_model/transaction_type_view_model.dart';
import 'view_model/update_profile_view_model.dart';
import 'view_model/view_bank_view_model.dart';
import 'view_model/withdraw_history_view_model.dart';
import 'view_model/withdraw_view_model.dart';

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
    width=kIsWeb?400:MediaQuery.of(context,).size.width;
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
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => SplashServices()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UpdateViewModel()),
        ChangeNotifierProvider(create: (context) => AvtarViewModel()),
        ChangeNotifierProvider(create: (context) => EditPasswordViewModel()),
        ChangeNotifierProvider(create: (context) => NotificationViewModel()),
        ChangeNotifierProvider(create: (context) => AboutUsViewModel()),
        ChangeNotifierProvider(create: (context) => GiftCardViewModel()),
        ChangeNotifierProvider(create: (context) => GiftHistoryViewModel()),
        ChangeNotifierProvider(create: (context) => FeedBackViewModel()),
        ChangeNotifierProvider(create: (context) => MainWalletTransferViewModel()),
        ChangeNotifierProvider(create: (context) => ChooseBankViewModel()),
        ChangeNotifierProvider(create: (context) => AddBankViewModel()),
        ChangeNotifierProvider(create: (context) => ViewBankViewModel()),
        ChangeNotifierProvider(create: (context) => PaymentLimitViewModel()),
        ChangeNotifierProvider(create: (context) => WithdrawHistoryViewModel()),
        ChangeNotifierProvider(create: (context) => TransactionTypeViewModel()),
        ChangeNotifierProvider(create: (context) => TransactionHistoryViewModel()),
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
