import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';

import 'tab_page/email_login.dart';
import 'tab_page/phone_number_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedCountryCode = '+91';
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _inviteController = TextEditingController();
  bool _passwordVisible = false;
  bool _passwordVisibleTwo = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesBg),fit: BoxFit.fill)
        ),
        child: ListView(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(8),
          children: [
            SizedBox(height: height*0.1,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sign up ",
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
              "Welcome Let's create your account ",
              style: TextStyle(
                  color: AppColor.lightGray,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "SitkaSmall"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height*0.02,),
            SvgPicture.asset(Assets.svgPhone,
                height: height*0.05,
                colorFilter: ColorFilter.mode(
                  AppColor.white, // Apply the color here
                  BlendMode.srcIn,
                )),
        SizedBox(height: height*0.01,),
        Center(
          child: Text(
            "Register your phone",
            style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: "SitkaSmall"),),
        ),
            Container(
              width: width,
              margin: EdgeInsets.only(top: 2),
              height: 2,
              decoration: BoxDecoration(
                  gradient:   LinearGradient(
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
                  // image: DecorationImage(image: AssetImage(Assets.imagesBg),fit: BoxFit.fill)
              ),
            ),
            SizedBox(height: height*0.02,),
            Row(
              children: [
                SvgPicture.asset(Assets.svgPhone,
                    height: height*0.04,
                    colorFilter: ColorFilter.mode(
                      AppColor.white, // Apply the color here
                      BlendMode.srcIn,
                    )),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "Phone number",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.29,
                  height: height*0.07,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:AppColor.white)),

                      color: AppColor.gray.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: CountryCodePicker(
                      onChanged: (countryCode) {
                        setState(() {
                          _selectedCountryCode = countryCode.dialCode!;
                        });
                      },
                      initialSelection: 'IN', // Default selection (India)
                      showCountryOnly: false, // Show both country and code
                      showFlag: false, // Display country flag
                      showFlagDialog: true,
                      showDropDownButton: true,
                      dialogSize: Size(350, 300),
                      boxDecoration: BoxDecoration(
                        color: AppColor.lightGray,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:Colors.transparent,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColor.lightGray),
                      // Option to show flag in the dialog
                    ),
                  ),
                ),
                CustomTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  label: "Enter your phone number",

                  hintColor: AppColor.lightGray,
                  hintSize: 16,
                  height: 55,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: width * 0.65,
                  maxLength: 10,
                  filled: true,
                  borderSide: BorderSide(color: Colors.white),
                  fillColor: AppColor.gray.withOpacity(0.5),
                  border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(15),
                  fieldRadius: BorderRadius.circular(15),
                ),
              ],
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
                  "Set password",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: "SitkaSmall",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            CustomTextField(
              controller: _passController,
              label: "Set password",
              hintColor: AppColor.lightGray,
              hintSize: 16,
              maxLines: 1,
              obscureText: !_passwordVisible,
              height: 55,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // width: width*0.65,
              maxLength: 10,
              filled: true,
              borderSide: BorderSide(color: Colors.white),
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
                  "Confirm password",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: "SitkaSmall",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            CustomTextField(
              controller: _confirmPassController,
              label: "Confirm password",
              hintColor: AppColor.lightGray,
              hintSize: 16,
              maxLines: 1,
              obscureText: !_passwordVisibleTwo,
              height: 55,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // width: width*0.65,
              maxLength: 10,
              filled: true,
              borderSide: BorderSide(color: Colors.white),
              fillColor: AppColor.gray.withOpacity(0.5),
              border: Border.all(color: AppColor.gray.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(15),
              fieldRadius: BorderRadius.circular(15),
              suffix: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisibleTwo ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisibleTwo = !_passwordVisibleTwo;
                  });
                },
              ),
            ),
            SizedBox(
              height: height * 0.035,
            ),

            Row(
              children: [
                SvgPicture.asset(Assets.svgInvitionCode,
                    height: height*0.04,
                    colorFilter: ColorFilter.mode(
                      AppColor.white, // Apply the color here
                      BlendMode.srcIn,
                    )),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "Invite code",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: "SitkaSmall",
                      fontWeight: FontWeight.w600),
                ),

              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            CustomTextField(
              controller: _inviteController,
              label: "Enter invitation code",
              hintColor: AppColor.lightGray,
              hintSize: 16,
              maxLines: 1,
              obscureText: !_passwordVisible,
              height: 55,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // width: width*0.65,
              maxLength: 10,
              filled: true,
              borderSide: BorderSide(color: Colors.white),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.gray, width: 2),
                      color: isChecked ? Colors.green : null,
                    ),
                    child: isChecked
                        ? Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                        : null,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                // Text(
                //   "I have read and agree",
                //   style: TextStyle(
                //       color: AppColor.white,
                //       fontSize: 14,
                //       fontFamily: "SitkaSmall",
                //       fontWeight: FontWeight.w300),
                // ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "I have read and agree ",
                          style: TextStyle(color: AppColor.white)),
                      TextSpan(
                        text: '⟬Privacy Agreement⟭',
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.w600,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamed(
                            //     context, RoutesName.registerScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.035,
            ),
            constantbutton(onTap: () {  }, text: 'Register',),
            SizedBox(
              height: height * 0.02,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                      text: "I have an account ",
                      style: TextStyle(color: AppColor.white)),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      // decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      Navigator.pop(context);
                        // Navigator.pushNamed(
                        //     context, RoutesName.registerScreen);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
