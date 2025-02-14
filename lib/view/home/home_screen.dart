import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/res/bubble_animation/Particles.dart';
import 'package:game/res/bubble_animation/particle_engine.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view/home/slider_page.dart';
import 'package:game/view_model/jili_game_launcher_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:game/view_model/update_jili_to_user_wallet_view_model.dart';
import 'package:iconly/iconly.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import 'category_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver  {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context,listen: false).userProfileApi(context);
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Observer remove karein
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final jiliApi=Provider.of<JiliGameLauncherViewModel>(context,listen: false);

    if (state == AppLifecycleState.resumed&&jiliApi.isGameLaunched==true) {
Provider.of<UpdateJiliToUserWalletViewModel>(context,listen: false).updateJilliToUserWalletApi(context);
jiliApi.setIsGameLaunched(false);
    }
  }
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar:
      GradientAppBar(
        title: Text("Xgamblur",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),
        actions: [
          InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.notificationScreen);
              },
              child: Icon(IconlyBold.notification,color: AppColor.white,)),
          SizedBox(width: width*0.1,)
        ],
      ),

      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        children: [
          Column(
            children: [
              // Background with particles
              SizedBox(
                height: height * 0.28, // Adjust height to fit the content properly
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
                    Positioned.fill(child: SliderPage()), // Ensuring SliderPage is within bounds
                  ],
                ),
              ),

              // Info Bar with Marquee Text
              Container(
                width: width,
                height: height * 0.07,
                // margin: EdgeInsets.only(top: height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.darkGrayTwo,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.volume_up_outlined, color: AppColor.white),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.6,
                      child: Marquee(
                        text: "Exactly equal parts red, green, and blue in the RGB color space.",
                        style: TextStyle(fontFamily: "SitkaSmall", color: AppColor.lightGray),
                        scrollAxis: Axis.horizontal,
                        blankSpace: 15.0,
                        velocity: 50.0,
                        startPadding: 200.0,
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                    constantbutton(
                      width: width * 0.2,
                      onTap: () {},
                      text: 'Details',
                      style: TextStyle(
                        fontFamily: "SitkaSmall",
                        color: AppColor.lightGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01), // Space between info bar and category page

              // Category Page Below Slider
              CategoryPage(),
            ],
          ),
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
