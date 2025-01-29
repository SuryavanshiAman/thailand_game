import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';


class WithdrawViewModel with ChangeNotifier{
  final List<Map<String, dynamic>> withdrawOptions = [
    {
      'title': 'BANK CARD',
      'image': Assets.imagesBankCard,
      'bgColor': Colors.black,
    },
    {
      'title': 'USDT',
      'image': Assets.imagesUsdt,
      'bgColor': Colors.black,
      'badge': '+2%',
    },
  ];
}