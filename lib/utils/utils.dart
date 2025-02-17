
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'routes/routes_name.dart';

class Utils {
  static copyToClipboard(String code, BuildContext context) {
    Clipboard.setData(
      ClipboardData(
        text: code,

      ),
    ).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Copied to clipboard'),
        ),
      ),
    );
  }
  static setSnackBar(String msg,Color color, BuildContext context) {
    showToastWidget(
      Container(
        margin: EdgeInsets.only(top: 30),
        width: width*0.8,
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:   Text(
          msg,
          style:  TextStyle(
            color:AppColor.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

  static showExitConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: AppColor.darkGray,
      shape: const RoundedRectangleBorder(
          // side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 28),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.white,
                    )),
              ),
              SizedBox(height: height / 30),
              const Center(
                child: Text("Exit App",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: height * 0.02),
              const Center(
                child: Text("Are you sure want to exit app?",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: SizedBox(
                  width: width * 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: constantbutton(
                          // width: width*0.8,
                          onTap: (){  SystemNavigator.pop();}, text: "Yes")),
                      SizedBox(height: height * 0.03),
                      Center(child: constantbutton(
                          // width: width*0.8,
                          onTap: (){Navigator.pop(context);}, text: "No")),

                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ) ??
        false;
  }
  static Future<bool?> showLogOutConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: AppColor.darkGray,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height dynamically
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 28),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColor.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.gray,
                  child: Image.asset(
                    Assets.imagesLogOut,
                    color: AppColor.white,
                    scale: 2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Logging out?",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Are you sure you want to log out of this\naccount?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: constantbutton(
                    // width: width*0.8,
                    onTap:( ){
                      UserViewModel userViewModel = UserViewModel();
                      userViewModel.remove();
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.pushReplacementNamed(
                          context, RoutesName.loginScreen);
                    }, text: "Yes, Logout"),
              ),
              const SizedBox(height: 16),
              Center(
                child: constantbutton(
                    // width: width*0.8,
                    onTap:( ){
                      Navigator.pop(context, false);
                    }, text: "Cancel"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
  static Future<void> launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("Trying to launch: $uri");

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch: $uri");
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }
}
