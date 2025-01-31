import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/bubble_animation/Particles.dart';
import 'package:game/res/bubble_animation/particle_engine.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context,listen: false).userProfileApi(context);

  }

  @override
  Widget build(BuildContext context) {
    final elementList = Provider.of<ProfileViewModel>(context);
    final profile=elementList.profileData?.data;
    print(profile?.name);
    List<GameModel> gameList = [
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.notificationScreen);
      }),
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.giftScreen);

      }),
      GameModel(onTap: () {}),
    ];
    List<GameModel> setting = [
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.settingPageNew);
      }),
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.feedBackScreen);

      }),
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.notificationScreen);
      }),
      GameModel(onTap: () {}),
      GameModel(onTap: () {}),
      GameModel(onTap: () {
        Navigator.pushNamed(context, RoutesName.aboutUsScreen);
      }),
    ];
    return Scaffold(
      backgroundColor: AppColor.black,
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Particles(
                  awayRadius: 200,
                  particles: createParticles(),
                  height: height,
                  width: width,
                  onTapAnimation: true,
                  awayAnimationDuration: const Duration(seconds: 3),
                  awayAnimationCurve: Curves.linear,
                  enableHover: true,
                  hoverRadius: 90,
                  connectDots: false,
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                padding: EdgeInsets.only(bottom: height * 0.07),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.black,
                        AppColor.gray,
                        AppColor.black,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage(Assets.imagesProfile),
                      backgroundImage: NetworkImage(profile?.image??""),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profile?.name??""
                          "Nanacy Momoland",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                              fontFamily: "SitkaSmall"),
                        ),
                        Container(
                            width: width * 0.5,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColor.darkGrayTwo,
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "UID",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontFamily: "SitkaSmall"),
                                ),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: AppColor.white,
                                ),
                                Text(
                                 profile?.uId?? "420",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontFamily: "SitkaSmall"),
                                ),
                                Icon(
                                  Icons.copy,
                                  color: AppColor.white,
                                  size: 18,
                                ),
                              ],
                            )),
                        Text(
                          "Last login: Jan 10 11:19",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontFamily: "SitkaSmall"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: height * 0.2, left: width * 0.03, right: width * 0.03),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.darkGray,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total balance",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18,
                          fontFamily: "SitkaSmall"),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹${profile?.wallet??"0.00"}",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                              fontFamily: "SitkaSmall"),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        InkWell(
                            onTap: (){
                              elementList.userProfileApi(context);
                            },
                            child: Image.asset(Assets.imagesTotalBal))
                        // Icon(
                        //   Icons.refresh,
                        //   color: AppColor.lightGray,
                        // )
                      ],
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black,
                            AppColor.white,
                            Colors.black,
                            AppColor.white,
                            Colors.black
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        groups(
                          Assets.imagesDeposit,
                          'Deposit',
                          () {
                            Navigator.pushNamed(context, RoutesName.depositScreen);
                          },
                        ),
                        groups(
                          Assets.imagesWithdraw,
                          'Withdrawal',
                          () {
                            Navigator.pushNamed(context, RoutesName.withdrawScreen);

                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          GridView.builder(
            
              padding: EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Increase vertical spacing between items
                  mainAxisExtent: 110,
                  crossAxisSpacing: 10),
              itemCount: elementList.elementList.length,
              itemBuilder: (BuildContext context, index) {
                final data = elementList.elementList[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(top: 18),
                  child: InkWell(
                      onTap: () {
                        if (data.onTap != null) {
                          data.onTap!(context);
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: AppColor.darkGray,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      data.image,
                                    ),
                                    height: height * 0.05,
                                  ),
                                  Container(
                                    width: width * 0.35,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.name,
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 14,
                                              fontFamily: "SitkaSmall",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          data.subTitle,
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 12,
                                              fontFamily: "SitkaSmall",
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Shimmer.fromColors(
                            period: Duration(seconds: 6),
                            baseColor:Colors.transparent,
                            highlightColor:AppColor.white.withOpacity(0.3),
                            child: Container(
                              // margin: EdgeInsets.only(top: height*0.02),
                              height: height * 0.12,
                              // width: width * 0.5,
                              decoration: const BoxDecoration(
                                color: Colors
                                    .blue, // Replace with your secondary color
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                            ),
                          ),

                        ],
                      )),
                );
              }),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.03,
              left: width*0.03,
              right: width*0.03
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // color: AppColor.darkGray,
                gradient: AppColor.appBarGradient,
                borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: elementList.elementListTwo.length,
                itemBuilder: (context, index) {
                  final elementListTwo = elementList.elementListTwo[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (gameList[index].onTap != null) {
                            gameList[index].onTap!();
                          }
                        },
                        child: ListTile(
                          shape: Border(
                              bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1)), // Bottom border

                          tileColor: AppColor.darkGray,
                          leading: Image.asset(
                            elementListTwo['images'] ?? "",
                            scale: index == 1 ? 3 : 2,
                          ), // Use 'images' key to get the image asset
                          title: Text(
                            elementListTwo['title'].toString(),
                            style: TextStyle(color: AppColor.white),
                          ), // Use 'title' key to get the title text
                          trailing: Icon(
                            IconlyLight.arrow_right_2,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.black,
                              AppColor.white,
                              Colors.black,
                              // Color(0xFFE3BE46),
                              AppColor.white,
                              Colors.black
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.03,
                left: width*0.03,
                right: width*0.03
            ),
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                // color: AppColor.darkGray,
                gradient: AppColor.appBarGradient,
                borderRadius: BorderRadius.circular(20)),
            child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        3, // Increase vertical spacing between items
                    mainAxisExtent: 80,
                    crossAxisSpacing: 10),
                itemCount: elementList.elementListThree.length,
                itemBuilder: (BuildContext context, index) {
                  final data = elementList.elementListThree[index];
                  return InkWell(
                    onTap: () {
                      if (setting[index].onTap != null) {
                        setting[index].onTap!();
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          data['images'].toString(),
                          height: height * 0.05,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.35,
                          child: Text(
                            data['title'].toString(),
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 12,
                                fontFamily: "SitkaSmall",
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          constantbutton(
            
            width: width,
              onTap: () {
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              },
              text: "Logout"),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  groups(String img, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            width: width * 0.16,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: AppColor.boxGradient),
            child: Center(
              child: Image.asset(
                img,
                height: 40,
              ),
            ),
            //color: Colors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          textWidget(
              text: title,
              color: AppColor.white,
              fontSize: 12,
              fontFamily: "SitkaSmall",
              fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
  List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: AppColor.darkGray,
        size: rng.nextDouble() * 10,
        velocity: Offset(rng.nextDouble() * 50 * randomSign(),
            rng.nextDouble() * 50 * randomSign()),
      ));
    }
    return particles;
  }

  double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
}

class GameModel {
  final VoidCallback? onTap;
  GameModel({this.onTap});
}
