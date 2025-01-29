import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';

class GameViewModel with ChangeNotifier{
  List<Map<String, String>>gameCategories=[
    {
      "images":Assets.categoryLottery,
      "title":"Lottery",
    },
    {
      "images":Assets.categoryMiniGame,
      "title":"Mini games",
    },
    {
      "images":Assets.categoryPopular,
      "title":"Popular",
    },
    {
      "images":Assets.categoryFishing,
      "title":"Fishing",
    },

  ];
}
