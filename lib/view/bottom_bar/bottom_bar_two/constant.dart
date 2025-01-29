
import 'package:flutter/material.dart';
import 'package:game/view/bottom_bar/bottom_bar_two/app_size.dart';
import 'package:game/view/home/home_screen.dart';
import 'package:game/view/profile/profile_screen.dart';
import 'package:game/view/wallet/wallet_screen.dart';

import 'sample_widget.dart';
List<Widget> screens = [
  HomeScreen(),
  WalletScreen(),
  ProfileScreen(),
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 12.5;
    // case 1:
    //   return AppSizes.blockSizeHorizontal * 24.8;
    case 1:
      return AppSizes.blockSizeHorizontal * 43.5;
    // case 3:
    //   return AppSizes.blockSizeHorizontal * 62.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 75.5;
    default:
      return 0;
  }
}
//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

final List<Color> gradient = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent
];
