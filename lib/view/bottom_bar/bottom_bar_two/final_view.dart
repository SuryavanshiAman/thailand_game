import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/color-const.dart';
import 'package:game/view/bottom_bar/bottom_bar_two/app_size.dart';
import 'package:game/view/bottom_bar/bottom_bar_two/clipper.dart';
import 'package:iconly/iconly.dart';

import 'bottom_nav_btn.dart';
import 'constant.dart';

//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//
class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  FinalViewState createState() => FinalViewState();
}

class FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[900],
      //   title: const Text(
      //     "Custom Bottom Navigation Bar",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: SafeArea(
        // bottom: false,
        child:Scaffold(
          body:  Stack(
            children: [
              Positioned.fill(
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    controller: pageController,
                    children: screens,
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: bottomNav(),
              ),
            ],
          ) ,
        )

      ),
    );
  }

  Widget bottomNav() {
    return Padding(
      padding:
      EdgeInsets.zero,
      // EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,
      //     AppSizes.blockSizeHorizontal * 4.5, 100),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: CustomPaint(
          painter: CurvedPainter(),
          child: Container(
              height: AppSizes.blockSizeHorizontal * 18,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.grey[900],
                // gradient:AppColor.appBarGradient,
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                // borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: AppSizes.blockSizeHorizontal * 3,
                    right: AppSizes.blockSizeHorizontal * 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BottomNavBTN(
                          onPressed: (val) {
                            animateToPage(val);
                            setState(() {
                              _currentIndex = val;
                            });
                          },
                          icon: IconlyLight.home,
                          currentIndex: _currentIndex,
                          index: 0,
                        ),
                        // BottomNavBTN(
                        //   onPressed: (val) {
                        //     animateToPage(val);
                        //
                        //     setState(() {
                        //       _currentIndex = val;
                        //     });
                        //   },
                        //   icon: IconlyLight.search,
                        //   currentIndex: _currentIndex,
                        //   index: 1,
                        // ),
                        BottomNavBTN(
                          onPressed: (val) {
                            animateToPage(val);

                            setState(() {
                              _currentIndex = val;
                            });
                          },
                          icon: IconlyLight.wallet,
                          currentIndex: _currentIndex,
                          index: 1,
                        ),
                        // BottomNavBTN(
                        //   onPressed: (val) {
                        //     animateToPage(val);
                        //
                        //     setState(() {
                        //       _currentIndex = val;
                        //     });
                        //   },
                        //   icon: IconlyLight.setting,
                        //   currentIndex: _currentIndex,
                        //   index: 3,
                        // ),
                        BottomNavBTN(
                          onPressed: (val) {
                            animateToPage(val);

                            setState(() {
                              _currentIndex = val;
                            });
                          },
                          icon: IconlyLight.profile,
                          currentIndex: _currentIndex,
                          index: 2,
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      top: 0,
                      left: animatedPositionedLEftValue(_currentIndex),
                      child: Column(
                        children: [
                          Container(
                            height: AppSizes.blockSizeHorizontal * 1.0,
                            width: AppSizes.blockSizeHorizontal * 12,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          ClipPath(
                            clipper: MyCustomClipper(),
                            child: Container(
                              height: AppSizes.blockSizeHorizontal * 15,
                              width: AppSizes.blockSizeHorizontal * 12,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: gradient,
                                  )),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ..color = Colors.black
      ..color= AppColor.lightGray
      ..style = PaintingStyle.fill;


    final path = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.5, -10, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}