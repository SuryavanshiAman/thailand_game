import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/language/english.dart';
import 'package:game/language/hindi.dart';
import 'package:game/language/thai.dart';
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
import 'package:game/view_model/jili_game_launcher_view_model.dart';
import 'package:game/view_model/live_notification_view_model.dart';
import 'package:game/view_model/pay_usdt_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:game/view_model/update_jili_to_user_wallet_view_model.dart';
import 'package:game/view_model/update_language_view_model.dart';
import 'package:game/view_model/usdt_deposit_view_model.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view/game/Aviator/view_model/aviator_history_view_model.dart';
import 'view/game/wingo/view_model/win_go_game_his_view_model.dart';
import 'view/game/wingo/view_model/win_go_my_his_view_model.dart';
import 'view_model/aboutus_view_model.dart';
import 'view_model/add_bank_view_model.dart';
import 'view_model/all_game_list_view_model.dart';
import 'view_model/choose_bank_view_model.dart';
import 'view_model/customer_service_view_model.dart';
import 'view_model/deposit_history_view_model.dart';
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
import 'view_model/update_jili_wallet_view_model.dart';
import 'view_model/update_profile_view_model.dart';
import 'view_model/usdt_bank_address_view_model.dart';
import 'view_model/usdt_view_bank_view_model.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLang();
  }

  getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final currentLang =  prefs.getString('lang') ?? 'en';
    Locale locale;
    switch (currentLang) {
      case 'Hindi':
        locale = const Locale('hi', 'IN');
        break;
      case 'Thai':
        locale = const Locale('th', 'TH');
        break;
      default:
        locale = const Locale('en', 'US');
    }

    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    // final lang=Provider.of<UpdateLanguageViewModel>(context);

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
        ChangeNotifierProvider(create: (context) => AllGameListViewModel()),
        ChangeNotifierProvider(create: (context) => JiliGameLauncherViewModel()),
        ChangeNotifierProvider(create: (context) => AviatorHistoryViewModel()),
        ChangeNotifierProvider(create: (context) => UsdtDepositViewModel()),
        ChangeNotifierProvider(create: (context) => PayUsdtViewModel()),
        ChangeNotifierProvider(create: (context) => CustomerServiceViewModel()),
        ChangeNotifierProvider(create: (context) => UsdtBankViewModel()),
        ChangeNotifierProvider(create: (context) => USdtViewBankViewModel()),
        ChangeNotifierProvider(create: (context) => DepositHistoryViewModel()),
        ChangeNotifierProvider(create: (context) => UpdateJiliToUserWalletViewModel()),
        ChangeNotifierProvider(create: (context) => UpdateJiliWalletViewModel()),
        ChangeNotifierProvider(create: (context) => UpdateLanguageViewModel()),
        ChangeNotifierProvider(create: (context) => LiveNotificationViewModel()),
      ],
      child: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: width
          ),
          child: GetMaterialApp(
            translations: LocaleTranslations(),
            locale: const Locale('en', 'US'), // Set the default locale
            fallbackLocale: const Locale('en''US'),
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
class LocaleTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': LocaleStringEn().keys['en_US']!,
    'hi_IN': LocaleStringHi().keys['hi_IN']!,
    'th_TH': LocaleStringTh().keys['th_TH']!,

  };
}
double height=0.0;
double width=0.0;
