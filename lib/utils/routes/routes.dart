
import 'package:flutter/material.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/auth/login_screen.dart';
import 'package:game/view/auth/register_screen.dart';
import 'package:game/view/auth/splash_screen.dart';
import 'package:game/view/bottom_bar/bottom_bar_two/final_view.dart';
import 'package:game/view/bottom_bar/bottom_nav_bar.dart';
import 'package:game/view/home/home_screen.dart';
import 'package:game/view/home/notification_screen.dart';
import 'package:game/view/profile/about_us/about_us.dart';
import 'package:game/view/profile/about_us/about_us_screen.dart';
import 'package:game/view/profile/feed_back_screen.dart';
import 'package:game/view/profile/game_history_screen.dart';
import 'package:game/view/profile/gift_screen.dart';
import 'package:game/view/profile/setting_page/change_avtar_screen.dart';
import 'package:game/view/profile/setting_page/change_login_password.dart';
import 'package:game/view/profile/setting_page/nickname_screen.dart';
import 'package:game/view/profile/setting_page/setting_screen.dart';
import 'package:game/view/wallet/bank_details/bank_screen.dart';
import 'package:game/view/wallet/bank_details/usdt_address.dart';
import 'package:game/view/wallet/deposit/deposit_history_screen.dart';
import 'package:game/view/wallet/deposit/deposit_screen.dart';
import 'package:game/view/wallet/transaction_history_screen.dart';
import 'package:game/view/wallet/withdraw/choose_bank_screen.dart';
import 'package:game/view/wallet/withdraw/withdraw_history_screen.dart';
import 'package:game/view/wallet/withdraw/withdraw_screen.dart';

import 'routes_name.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
      case RoutesName.loginScreen:
        return (context) => const LoginScreen();
      case RoutesName.registerScreen:
        return (context) => const RegisterScreen();
      case RoutesName.homeScreen:
        return (context) => const HomeScreen();
      case RoutesName.bottomNavBar:
        return (context) =>  CustomBottomBar();
      case RoutesName.depositScreen:
        return (context) =>  DepositScreen();
      case RoutesName.withdrawScreen:
        return (context) => WithdrawScreen ();
      case RoutesName.bankScreen:
        return (context) => BankScreen ();
      case RoutesName.usdtAddress:
        return (context) => UsdtAddress ();
      case RoutesName.notificationScreen:
        return (context) => NotificationScreen ();
      case RoutesName.settingPageNew:
        return (context) => SettingPageNew ();
      case RoutesName.depositHistoryScreen:
        return (context) => DepositHistoryScreen ();
      case RoutesName.withdrawHistoryScreen:
        return (context) => WithdrawHistoryScreen ();
      case RoutesName.transactionHistoryScreen:
        return (context) =>  TransactionHistoryScreen();
      case RoutesName.gameHistoryScreen:
        return (context) =>  GameHistoryScreen();
      case RoutesName.giftScreen:
        return (context) =>  GiftScreen();
      case RoutesName.changeLoginPasswordScreen:
        return (context) =>  ChangeLoginPasswordScreen();
      case RoutesName.aboutUsScreen:
        return (context) =>  AboutUsScreen();
      case RoutesName.feedBackScreen:
        return (context) =>  FeedBackScreen();
      case RoutesName.nickNameScreen:
        return (context) =>  NickNameScreen();
      case RoutesName.changeAvtar:
        return (context) =>  ChangeAvtar();
      case RoutesName.commonAboutPage:
        return (context) =>  CommonAboutPage();
      case RoutesName.chooseBankScreen:
        return (context) =>  ChooseBankScreen();
      default:
        return (context) => Scaffold(
          body: Center(
            child: textWidget(
                text: 'No Route Found!',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        );
    }
  }
}
