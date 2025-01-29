
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/bubble_animation/Particles.dart';
import 'package:game/res/bubble_animation/particle_engine.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  GiftScreenState createState() => GiftScreenState();
}

class GiftScreenState extends State<GiftScreen> {
  TextEditingController giftcode = TextEditingController();

  String number = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
          leading: AppBackBtn(),
          centerTitle: true,
          title: textWidget(
            text: 'Gift',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: "SitkaSmall",
            color: AppColor.white,
          ),
          gradient: AppColor.appBarGradient),
      body: ListView(
        children: [
          Column(
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
                    Positioned.fill(child:Container(
                      height: height / 3.5,
                      width: width,
                      decoration:  BoxDecoration(
                          gradient: AppColor.gradient,
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesGift),
                          )),
                    ),), // Ensuring SliderPage is within bounds
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),
              Container(
                // ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: AppColor.appBarGradient
                  ),
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  // height: height,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                            text: '   Hi',
                            fontSize: 14,
                            fontFamily: "SitkaSmall",
                            color: AppColor.white,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        textWidget(
                            text: '   We have a gift for you',
                            fontFamily: "SitkaSmall",
                            fontSize: 14,
                            color: AppColor.white),
                        const SizedBox(
                          height: 25,
                        ),
                        textWidget(
                            text: '   Please enter the gift code below',
                            fontFamily: "SitkaSmall",
                            fontSize: 14,
                            color:AppColor.white),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          controller: giftcode,
                          label: "Please enter gift code",
                          hintColor: AppColor.lightGray,

                          hintSize: 16,
                          height: 55,
                          borderSide: BorderSide(color: Colors.white),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          // width: width*0.65,
                          maxLength: 10,
                          filled: true,
                          fillColor: AppColor.gray.withOpacity(0.5),
                          border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(15),
                          fieldRadius: BorderRadius.circular(15),
                        ),
                        SizedBox(height: height*0.03,),
                        constantbutton(
                          text: 'Receive',
                          onTap: () {
                          },
                        )
                      ],
                    ),
                  )),
              Container(
                height: height*0.4,
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.darkGray
                  // gradient: AppColors.primaryUnselectedGradient
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.svgFeedback,height: 30,),

                        textWidget(
                            text: '   History',
                            fontSize: 18,
                            color: AppColor.white,
                            fontFamily: "SitkaSmall",
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    const SizedBox(height: 15,),


                  ],
                ),
              )
            ],
          )

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
