import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar:  GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text(
          "Notification",
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListView.builder(
              itemCount:3,
              // items.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.black,
                          AppColor.gray,
                          AppColor.black,
                        ],
                        // stops: [0.1, 0.9,],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                        boxShadow: [BoxShadow(
                            color: AppColor.white.withOpacity(0.3),
                            blurRadius: 2,
                            offset: Offset(1, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Assets.imagesProNotification,scale: 1.5,color: AppColor.white,),
                              SizedBox(width: width*0.02,),
                              textWidget(text:"Login notification",
                                  // items[index].name.toString(),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white
                              ),
                              const Spacer(),
                              // Image.asset(Assets.iconsDeleat,scale: 1.5,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  textWidget(text:"Your account has just been logged in at 2025-01-24 01:34:58. If you have any questions, please contact online customer service for consultation! I wish you happy gaming and lots of profits",
                                // items[index].name.toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightGray

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );

              }),
        ],
      ),
    );
  }
}
