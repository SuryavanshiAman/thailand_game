import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/bubble_animation/Particles.dart';
import 'package:game/res/bubble_animation/particle_engine.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view/profile/setting_page/nickname_screen.dart';


class SettingPageNew extends StatefulWidget {
  const SettingPageNew({super.key});

  @override
  State<SettingPageNew> createState() => _SettingPageNewState();
}

class _SettingPageNewState extends State<SettingPageNew> {
  @override
  void initState() {
    // fetchData();
    //
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    List<ListItem> settingList = [
      ListItem(
          image: Assets.imagesEditPswIcon,
          name: 'Login Password',
          subTitle: 'Edit',
          onTap: () {
            Navigator.pushNamed(context, RoutesName.changeLoginPasswordScreen);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassword()));
          }
      ),
      //   ListItem(
      //       image: Assets.imagesEmailIcon,
      //       name: 'Bind mailbox',
      //       subTitle: 'to bind',
      //       onTap: () {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>const BindMailBoxScreen()));
      // }
      //   ),
      ListItem(
          image: Assets.imagesVersionUpdate,
          name: 'Updated Version',
          subTitle:"1.0.1",
          onTap: () {}

      ),
    ];
    // context.read<ProfileProvider>();
    return Scaffold(
        backgroundColor: AppColor.black,
        appBar: GradientAppBar(
            leading: AppBackBtn(),
            centerTitle: true,
            title: textWidget(
              text: 'Setting center',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: "SitkaSmall",
              color: AppColor.white,
            )),
        body:
        ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Stack(
                children: [
                  Container(
                    height: height * 0.3, // Adjust height to fit the content properly
                    child: Stack(
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
                        // Positioned.fill(child: SliderPage()), // Ensuring SliderPage is within bounds
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: AppColor.gradient,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.04),
                          child: Container(
                            height: height * 0.35,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                                // color: AppColor.white,
                                gradient: AppColor.appBarGradient,
                                borderRadius:
                                BorderRadiusDirectional.circular(15)),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, RoutesName.changeAvtar);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         const ChangeAvtar()));
                                    },
                                    child: Row(
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            radius: 50,
                                            child: CircleAvatar(
                                              radius: 48,
                                              backgroundImage: AssetImage(Assets.imagesProfile),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        textWidget(
                                            text: 'Change Avatar ',
                                            color:
                                            AppColor.white,
                                            fontFamily: "SitkaSmall",
                                            fontSize: 16),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 17,
                                          color: AppColor.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => const NickNameScreen());
                                    },
                                    child: Row(
                                      children: [
                                        textWidget(
                                            text: '    NickName',
                                            color: AppColor.white,
                                            fontFamily: "SitkaSmall",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15),
                                        const Spacer(),
                                        textWidget(
                                          // text:  context.read<ProfileProvider>().userName.toString().toUpperCase(),
                                            text:  "NancyMomoLand",
                                            color: AppColor.white,
                                            fontFamily: "SitkaSmall",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 17,
                                          color: AppColor.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: AppColor.white,
                                  ),
                                  Row(
                                    children: [
                                      textWidget(
                                          text: '    UID',
                                          color: AppColor.white,
                                          fontFamily: "SitkaSmall",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      const Spacer(),
                                      textWidget(
                                          text: "1421886",
                                          color: AppColor.white,
                                          fontFamily: "SitkaSmall",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      IconButton(
                                        onPressed: () {
                                          // copyToClipboard(
                                          //     context.read<ProfileProvider>().uId.toString(),
                                          //     context);
                                        },
                                        icon: Icon(Icons.copy),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Container(
                              height: 20,
                              width: 3,
                              color: AppColor.white,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            textWidget(
                                text: 'Security Information',
                                color: AppColor.white,
                                fontSize: 22,
                                fontFamily: "SitkaSmall",
                                fontWeight: FontWeight.w900),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: settingList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (settingList[index].onTap != null) {
                                    settingList[index].onTap!(); // Call the onTap function if it's not null
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                      // color:AppColor.black,
                                      gradient:LinearGradient(
                                        colors: [
                                          AppColor.black,
                                          AppColor.gray,
                                          AppColor.black,
                                        ],
                                        // stops: [0.1, 0.9,],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Image.asset(settingList[index]
                                          .image
                                          .toString(),color: AppColor.white,height: height*0.06,),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      textWidget(
                                          text: settingList[index]
                                              .name
                                              .toString(),
                                          fontSize: 15,
                                          fontFamily: "SitkaSmall",
                                          fontWeight: FontWeight.w800,
                                          color:  AppColor.white.withOpacity(0.6)),
                                      const Spacer(),
                                      textWidget(
                                          text: settingList[index]
                                              .subTitle
                                              .toString(),
                                          fontSize: 15,
                                          fontFamily: "SitkaSmall",
                                          fontWeight: FontWeight.w800,
                                          color: AppColor.white.withOpacity(0.6)),
                                      Icon(Icons.arrow_forward_ios,
                                          size: 17,
                                          color:  AppColor.white.withOpacity(0.6)),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  // BaseApiHelper baseApiHelper = BaseApiHelper();
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

class ListItem {
  String? image;
  String? name;
  String? subTitle;
  VoidCallback? onTap;

  ListItem({
    this.image,
    this.name,
    this.subTitle,
    this.onTap,
  });
}
