import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/circular_button.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PhoneNumberLogin extends StatefulWidget {
  const PhoneNumberLogin({super.key});

  @override
  State<PhoneNumberLogin> createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  String _selectedCountryCode = '+91';
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _passwordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<AuthViewModel>(context);
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.svgPhone,
                height: height * 0.04,
                colorFilter: ColorFilter.mode(
                  AppColor.white, // Apply the color here
                  BlendMode.srcIn,
                )),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              "Phone number".tr,
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
              width: width * 0.26,
              height: height * 0.07,
              decoration: BoxDecoration(
                  color: AppColor.gray.withOpacity(0.5),
                  border: Border(bottom: BorderSide(color: AppColor.white)),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: CountryCodePicker(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  dialogSize: Size(350, 300),
                  boxDecoration: BoxDecoration(
                    color: AppColor.lightGray,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
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

                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColor.lightGray),
                  // Option to show flag in the dialog
                ),
              ),
            ),
            CustomTextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              label: "Enter your phone number".tr,
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        SizedBox(
          height: height * 0.035,
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.svgPassword,
                height: height * 0.04,
                colorFilter: ColorFilter.mode(
                  AppColor.white, // Apply the color here
                  BlendMode.srcIn,
                )),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              "Password".tr,
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
          label: "Password".tr,
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
                width: 25,
                height: 25,
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
            Text(
              "Remember password".tr,
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                  fontFamily: "SitkaSmall",
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        SizedBox(
          height: height * 0.035,
        ),
        login.loading==false?
        constantbutton(
          onTap: () {
            if (_phoneController.text.isEmpty) {
              Utils.setSnackBar("Please enter Phone no.".tr,AppColor.red, context);
            } else if (_phoneController.text.length != 10) {
              Utils.setSnackBar("Please enter proper Phone no.".tr,AppColor.red, context);
            } else if (_passController.text.isEmpty) {
              Utils.setSnackBar("Please enter your password".tr,AppColor.red, context);
            } else if (_passController.text.length < 6) {
              Utils.setSnackBar(
                  "The password must be at least 6 digits long.".tr,AppColor.red, context);
            } else {
              Map data = {
                "email": _phoneController.text,
                "password": _passController.text
              };
              login.authApi(data, context);
            }
          },
          text: 'Login'.tr,
        ):CircularButton(),
        SizedBox(
          height: height * 0.03,
        ),
        constantbutton(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.registerScreen);
          },
          text: 'Register'.tr,
        ),
      ],
    );
  }
}
