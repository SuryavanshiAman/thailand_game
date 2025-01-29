import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';

class ChangeLoginPasswordScreen extends StatefulWidget {
  const ChangeLoginPasswordScreen({super.key});

  @override
  State<ChangeLoginPasswordScreen> createState() => _ChangeLoginPasswordScreenState();
}

class _ChangeLoginPasswordScreenState extends State<ChangeLoginPasswordScreen> {
  bool _passwordVisible = false;
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar:  GradientAppBar(
          leading: AppBackBtn(),
          centerTitle: true,
          title: textWidget(
            text: 'Change login password',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: "SitkaSmall",
            color: AppColor.white,
          )),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(20,50,20,0),
        children: [

          Row(
            children: [
              SvgPicture.asset(Assets.svgPassword,
                  height: height*0.04,
                  colorFilter: ColorFilter.mode(
                    AppColor.white, // Apply the color here
                    BlendMode.srcIn,
                  )),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "Login password",
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontFamily: "SitkaSmall",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CustomTextField(
            controller: _passController,
            label: "Password",
            hintColor: AppColor.lightGray,
            hintSize: 16,
            maxLines: 1,
            obscureText: !_passwordVisible,
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
            suffix: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.svgPassword,
                  height: height*0.04,
                  colorFilter: ColorFilter.mode(
                    AppColor.white, // Apply the color here
                    BlendMode.srcIn,
                  )),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "New login password",
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontFamily: "SitkaSmall",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextField(
            controller: _passController,
            label: "Password",
            hintColor: AppColor.lightGray,
            hintSize: 16,
            maxLines: 1,
            obscureText: !_passwordVisible,
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
            suffix: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.svgPassword,
                  height: height*0.04,
                  colorFilter: ColorFilter.mode(
                    AppColor.white, // Apply the color here
                    BlendMode.srcIn,
                  )),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "Confirm new password",
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontFamily: "SitkaSmall",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CustomTextField(
            controller: _passController,
            label: "Password",
            hintColor: AppColor.lightGray,
            hintSize: 16,
            maxLines: 1,
            obscureText: !_passwordVisible,
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
            suffix: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          constantbutton(onTap: () {  }, text: 'Save changes',)
        ],
      ),
    );
  }
}
