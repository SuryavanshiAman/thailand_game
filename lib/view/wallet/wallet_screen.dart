import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/bubble_animation/Particles.dart';
import 'package:game/res/bubble_animation/particle_engine.dart';
import 'package:game/res/circular_persent_indicator.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/main_wallet_transfer_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .userProfileApi(context);
    });
  }
  int _seconds = 5;
  Timer? _timer;
bool recalling =false;
  void startTimer() {
    setState(() {
      recalling=true;
    });
    _timer?.cancel(); // Cancel any existing timer
    _seconds = 5; // Reset timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          recalling=false;
        });
        timer.cancel();
        Provider.of<MainWalletTransferViewModel>(context,listen: false).mainWalletTransferApi(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileViewModel>(context).profileData?.data;
    final walletTransfer = Provider.of<MainWalletTransferViewModel>(context);
    print(profile?.wallet??"0.0");
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          "Wallet".tr,
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                height:
                    height * 0.25, // Adjust height to fit the content properly
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
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            // color: AppColor.gray,
                            color: AppColor.darkGray.withOpacity(0.5)),
                        width: width,
                        child: Column(
                          children: [
                            Icon(
                              IconlyBroken.wallet,
                              size: 50,
                              color: AppColor.white,
                            ),
                            Text(
                              "🪙${profile?.totalBalance ?? "0.0"}",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontFamily: "SitkaSmall",
                                  fontSize: 25),
                            ),
                            Text(
                              "Total Balance",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontFamily: "SitkaSmall",
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Ensuring SliderPage is within bounds
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                // height: height * 0.62,
                width: width * 0.9,
                decoration: BoxDecoration(
                    // color: AppColor.darkGray,
                    gradient: AppColor.appBarGradient,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        percentage(
                          (double.tryParse(profile?.wallet.toString() ?? "0") != null &&
                              double.tryParse(profile?.totalBalance.toString() ?? "0") != null &&
                              double.tryParse(profile?.totalBalance.toString() ?? "0") != 0
                              ? (double.parse(profile!.wallet.toString()) / (double.parse(profile!.totalBalance.toString()) * 0.01)).toStringAsFixed(2)
                              : "0.00"), // Ensure result is a valid string
                          (double.tryParse(profile?.wallet.toString() ?? "0")?.toStringAsFixed(2) ?? "0.00"),
                          'Main wallet',
                        ),
                        percentage(
                          (double.tryParse(profile?.thirdPartyWallet.toString() ?? "0") != null &&
                              double.tryParse(profile?.totalBalance.toString() ?? "0") != null &&
                              double.tryParse(profile?.totalBalance.toString() ?? "0") != 0
                              ? (double.parse(profile!.thirdPartyWallet.toString()) / (double.parse(profile.totalBalance.toString()) * 0.01)).toStringAsFixed(2)
                              : "0.00"), // Ensure result is a valid string
                          (double.tryParse(profile?.thirdPartyWallet.toString() ?? "0")?.toStringAsFixed(2) ?? "0.00"),
                          '3rd party wallet',
                        ),
                      ],
                    ),

                    SizedBox(
                      height: height * 0.03,
                    ),
                    constantbutton(
                      // height: height * 0.07,
                      width: width,
                      text:recalling==false? 'Main wallet transfer':"Recalling $_seconds",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "SitkaSmall",
                          color: AppColor.white),
                      onTap: () {
                        startTimer();

                        // mainWalletTransfer(context);
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        groups(
                          Assets.imagesDeposit,
                          'Deposit',
                          () {
                            Navigator.pushNamed(
                                context, RoutesName.depositScreen);
                          },
                        ),
                        groups(
                          Assets.imagesWithdraw,
                          'Withdrawal',
                          () {
                            Navigator.pushNamed(
                                context, RoutesName.withdrawScreen);
                          },
                        ),
                        groups(
                          Assets.imagesDepositHistory,
                          'Deposit\n history',
                          () {
                            Navigator.pushNamed(
                                context, RoutesName.depositHistoryScreen);
                          },
                        ),
                        groups(
                          Assets.imagesWithdrawHistory,
                          'Withdrawal\n     history',
                          () {
                            Navigator.pushNamed(
                                context, RoutesName.withdrawHistoryScreen);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
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

  Widget percentage(String percentData, String amount, String title) {
    // Ensure percentData can be parsed to a double
    double? percentage;
    try {
      percentage = double.parse(percentData) / 100;
    } catch (e) {
      percentage = 0;
    }

    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CircularPercentIndicator(
          animation: true,
          animationDuration: 1200,
          lineWidth: 10.0,
          startAngle: 8.0,
          radius: 120,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: AppColor.lightGrayOne,
          linearGradient: AppColor.greenGradient,
          percent: percentage.isNaN ? 0 : percentage,
          center: CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.black,
            child: textWidget(
              text: percentage.isNaN
                  ? "0.00%"
                  : '${(percentage * 100).toStringAsFixed(2)}%',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.currency_rupee,
              size: 16,
              color: AppColor.white,
            ),
            textWidget(
              text: amount,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              fontFamily: "SitkaSmall",
              color: AppColor.white,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        textWidget(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: "SitkaSmall",
          color: AppColor.white,
        ),
      ],
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
