import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/view/game/AndarBahar/andar_home_page.dart';
import 'package:game/view/game/all_jili_categories.dart';
import 'package:game/view/game/fishing_categories.dart';
import 'package:game/view/game/jili_categories.dart';
import 'package:game/view/game/popular_categories.dart';
import 'package:game/view/game/wingo/win_go.dart';
import 'package:game/view/game/Aviator/home_page_aviator.dart';
import 'package:game/view_model/all_game_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Categories with their subcategories and icons
  final Map<String, List<Map<String, String>>> categories = {
    "Lottery": [
      {
        "title": "Win Go",
        "subtitle": "Guess Number\nGreen/Red/Violet to win",
        "image": Assets.categoryWingoCoin1
      },
      {
        "title": "AndarBahar",
        "subtitle": "Place Bet\nAndar/Bahar",
        "image": Assets.andarbaharGirlCharSeven
      },
      {
        "title": "Aviator",
        "subtitle": "Place Bet",
        "image": Assets.aviatorAviatorWait
      },
    ],
    "Mini games": [
      {
        "title": "Spin the Wheel",
        "subtitle": "Guess Number\nGreen/Red/Violet to win",
        "image": Assets.categoryWingoCoin1
      },
      {
        "title": "Card Match",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryTrxCoin1
      },
      {
        "title": "Memory Game",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryFiveCoin
      },
    ],
    "Popular": [
      {
        "title": "Spin the Wheel",
        "subtitle": "Guess Number\nGreen/Red/Violet to win",
        "image": Assets.categoryWingoCoin1
      },
      {
        "title": "Card Match",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryTrxCoin1
      },
      {
        "title": "Memory Game",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryFiveCoin
      },
    ],
    "Fishing": [
      {
        "title": "Spin the Wheel",
        "subtitle": "Guess Number\nGreen/Red/Violet to win",
        "image": Assets.categoryWingoCoin1
      },
      {
        "title": "Card Match",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryTrxCoin1
      },
      {
        "title": "Memory Game",
        "subtitle": "Guess Number\nBig/Small/Odd/Even",
        "image": Assets.categoryFiveCoin
      },
    ],
    "View All":[]
  };

  // Corresponding images for each category
  final Map<String, String> categoryImages = {
    "Lottery": Assets.categoryLottery,
    "Mini games": Assets.categoryMiniGame,
    "Popular": Assets.categoryPopular,
    "Fishing": Assets.categoryFishing,
    "View All": Assets.categorySports,
  };

  String selectedCategory = "Lottery"; // Default selected category

  @override
  Widget build(BuildContext context) {
    List<GameModel> gameList = [
      GameModel(onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WinGo()));
      }),
      GameModel(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AndarBaharHome(gameId: '13')));
      }),
      GameModel(onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameAviator()));
      }),
    ];

    return Container(
      width: double.infinity,
      height: height * 0.65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories List (Left Side)
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: categories.keys.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    Provider.of<AllGameListViewModel>(context, listen: false)
                        .allGameListApi(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: selectedCategory == category
                          ? LinearGradient(
                              colors: [AppColor.gray, AppColor.black],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: selectedCategory == category
                          ? [
                              BoxShadow(
                                color: AppColor.white.withOpacity(0.5),
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      children: [
                        // Category Image
                        SvgPicture.asset(
                          categoryImages[category] ?? "",
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 5),
                        // Category Name
                        Text(
                          category,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: selectedCategory == category
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          selectedCategory == "Lottery"
              ? Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categories[selectedCategory]!.length,
                      itemBuilder: (context, index) {
                        final subcategory =
                            categories[selectedCategory]![index];

                        // Shimmer Effect (add this)
                        return InkWell(
                          onTap: () {
                            if (gameList[index].onTap != null) {
                              gameList[index].onTap!();
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: height * 0.13,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [AppColor.gray, AppColor.black],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.white.withOpacity(0.5),
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Left Section: Texts
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              subcategory["title"]!,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              subcategory["subtitle"]!,
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Right Section: Image
                                    Container(
                                      height: 80,
                                      width: 87,
                                      child: Image.asset(
                                        subcategory["image"]!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Shimmer.fromColors(
                                period: Duration(seconds: 6),
                                baseColor: Colors.transparent,
                                highlightColor: AppColor.white.withOpacity(0.3),
                                child: Container(
                                  margin: EdgeInsets.only(top: height * 0.015),
                                  height: height * 0.13,
                                  // width: width * 0.5,
                                  decoration: const BoxDecoration(
                                    color: Colors
                                        .blue, // Replace with your secondary color
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : selectedCategory == "Mini games"
                  ? JiliCategories(data: selectedCategory)
                  : selectedCategory == "Popular"
                      ? PopularCategories(data: selectedCategory)
                      : selectedCategory == "Fishing"
                          ? FishCategories(data: selectedCategory)
                          : AllJiliCategories(),
        ],
      ),
    );
  }
}

class GameModel {
  final VoidCallback? onTap;
  GameModel({this.onTap});
}
