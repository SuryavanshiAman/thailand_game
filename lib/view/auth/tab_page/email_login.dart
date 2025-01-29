import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  // String _selectedCountryCode = '+91';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _passwordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.svgEmail,
                height: height*0.04,
                colorFilter: ColorFilter.mode(
                  AppColor.white, // Apply the color here
                  BlendMode.srcIn,
                )),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              "Email/Account Log in",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontFamily: "SitkaSmall",
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: height * 0.015,
        ),
        CustomTextField(
          controller: _emailController,
          label: "Enter your email",
          hintColor: AppColor.lightGray,
          hintSize: 16,
          height: 55,
          borderSide: BorderSide(color: Colors.white),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: width * 0.65,
          maxLength: 10,
          filled: true,
          fillColor: AppColor.gray.withOpacity(0.5),
          border: Border.all(color: AppColor.gray.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(15),
          fieldRadius: BorderRadius.circular(15),
        ),
        SizedBox(
          height: height * 0.035,
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
              "Password",
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
        constantbutton(
          width: width,
          onTap: () {  }, text: 'Login',),
        SizedBox(
          height: height * 0.03,
        ),
        constantbutton(width: width,
          onTap: () {  }, text: 'Register',),
        SizedBox(
          height: height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
Column(
  children: [
    SvgPicture.asset(Assets.svgPassword,
        height: height*0.05,
        colorFilter: ColorFilter.mode(
          AppColor.white, // Apply the color here
          BlendMode.srcIn,
        )),
    Text(
      "Forgot password",
      style: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontFamily: "SitkaSmall",
          fontWeight: FontWeight.w600),
    ),

  ],
),
Column(
  children: [
    SvgPicture.asset(Assets.svgCustomer,
        height: height*0.05,
        colorFilter: ColorFilter.mode(
          AppColor.white, // Apply the color here
          BlendMode.color,
        )),
    Text(
      "Customer service",
      style: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontFamily: "SitkaSmall",
          fontWeight: FontWeight.w600),
    ),

  ],
),
          ],
        )
      ],
    );
  }
}
