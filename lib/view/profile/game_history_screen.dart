import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/main.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/filter_date-formate.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/AndarBahar/andhar_bahar_popup.dart';
import 'package:game/view/game/AndarBahar/constant/andar_bahar_history.dart';
import 'package:game/view/game/AndarBahar/constant/game_history.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/Aviator/widget/aviator_history.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view/game/wingo/widgets/my_history.dart';
import 'package:game/view_model/deposit_view_model.dart';
import 'package:game/view_model/game_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class GameHistoryScreen extends StatefulWidget {
  const GameHistoryScreen({super.key});

  @override
  State<GameHistoryScreen> createState() => _GameHistoryScreenState();
}

class _GameHistoryScreenState extends State<GameHistoryScreen> {
  int selectedCatIndex=0;
  int selectedId = 0;
  String typeName = 'All';
  DateTime? _selectedDate;
  final ScrollController _scrollController = ScrollController();
  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 100.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    final deposit = Provider.of<DepositViewModel>(context);
    final gameCategory = Provider.of<GameViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text("Bet History",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),

      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: height*0.02),
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            height: 80,
            // width: width * 0.93,
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: gameCategory.gameCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final items=gameCategory.gameCategories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCatIndex = index;
                      });
                      scrollToIndex(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      // height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: selectedCatIndex != index
                            ? AppColor.gray
                            : AppColor.lightGray.withOpacity(0.4),
                        gradient: selectedCatIndex != index
                            ? LinearGradient(
                          colors: [
                            AppColor.black,
                            AppColor.gray,
                            AppColor.black,
                          ],
                          // stops: [0.1, 0.9,],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                            : null,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.1),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('${items['images']??""}',height: 35,),
                          textWidget(
                            text: items['title']!,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),

          selectedCatIndex==0?  WingoMyHis(): selectedCatIndex==1?AndharBaharPopUpPage(gameid:"13"):AviatorHistory(),
          SizedBox(height: height*0.1,),

        ],
      ),
    );
  }
  Widget allTransactionType(BuildContext context, void Function(void Function()) setModalState) {
    final gameCategory = Provider.of<GameViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.black,
            AppColor.gray,
            AppColor.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: height * 0.35,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: AppColor.darkGray,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: textWidget(
                      text: 'Cancel',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.dividerColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {}); // Update main screen
                      Navigator.pop(context);
                    },
                    child: textWidget(
                      text: 'Confirm',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Increase vertical spacing between items
                  mainAxisExtent: 100,
                  crossAxisSpacing: 10),
              itemCount: gameCategory.gameCategories.length,
              itemBuilder: (BuildContext context, index) {
                final data = gameCategory.gameCategories[index];
                print(data['title'].toString());
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(top: 18),
                  child: InkWell(
                      onTap: () {
                        setModalState(() { // Use setModalState to update selection inside the bottom sheet
                          selectedId = index;
                          typeName = data['title'].toString();
                        });

                        if (kDebugMode) {
                          print(selectedId);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color:selectedId == index ?AppColor.lightGray:AppColor.darkGray,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                          SvgPicture.asset('${data['images']??""}',height: 35,),
                              Container(
                                width: width * 0.35,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                     data['title'].toString(),
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontFamily: "SitkaSmall",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))),
                );
              }),
        ],
      ),
    );
  }
}
