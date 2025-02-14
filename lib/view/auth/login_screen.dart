import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:get/get.dart';

import 'tab_page/email_login.dart';
import 'tab_page/phone_number_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesBg),fit: BoxFit.fill)
          ),
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: height*0.1,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome Back!".tr,
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                      fontFamily: "SitkaSmall"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  Text(
                    "Please sign in to your account".tr,
                    style: TextStyle(
                        color: AppColor.lightGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                    fontFamily: "SitkaSmall"),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5)
                    ),
                    height: height*0.1,
                    width: width,
                    child: TabBar(
                      // indicator: UnderlineTabIndicator(
                      //   borderSide: BorderSide(color: Colors.amber, width: 2),
                      //   // insets: EdgeInsets.symmetric(horizontal: 20),
                      // ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                      indicatorColor: AppColor.white,
                      labelColor:AppColor.white,
                      unselectedLabelColor:AppColor.lightGray,
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "SitkaSmall" ),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.phone_android),
                          child: const Text(
                            "Phone Number",
                            // style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Tab(
                          icon: Icon(Icons.email,),
                          child: const Text(
                            "Email / Account",
                            // style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                    width: width,
                    child: TabBarView(
                      children: [
                        PhoneNumberLogin(),
                        EmailLogin()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
