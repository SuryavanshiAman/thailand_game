import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';

class GameViewModel with ChangeNotifier{
  List<Map<String, String>>gameCategories=[
    {
      "images":Assets.categoryLottery,
      "title":"Wingo",
    },
    {
      "images":Assets.categoryPopular,
      "title":"AndarBahar",
    },
    {
      "images":Assets.categoryMiniGame,
      "title":"Aviator",
    },


  ];
}
