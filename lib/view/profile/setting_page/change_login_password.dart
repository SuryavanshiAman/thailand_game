import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/circular_button.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/edit_password_view_model.dart';
import 'package:game/view_model/user_view_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChangeLoginPasswordScreen extends StatefulWidget {
  const ChangeLoginPasswordScreen({super.key});

  @override
  State<ChangeLoginPasswordScreen> createState() => _ChangeLoginPasswordScreenState();
}

class _ChangeLoginPasswordScreenState extends State<ChangeLoginPasswordScreen> {
  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final update=Provider.of<EditPasswordViewModel>(context);
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar:  GradientAppBar(
          leading: AppBackBtn(),
          centerTitle: true,
          title: textWidget(
            text: 'Change login password'.tr,
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
                "Login password".tr,
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
                "New login password".tr,
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
            controller: _newController,
            label: "Password".tr,
            hintColor: AppColor.lightGray,
            hintSize: 16,
            maxLines: 1,
            obscureText: !_newPasswordVisible,
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
                _newPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _newPasswordVisible = !_newPasswordVisible;
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
                "Confirm new password".tr,
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
            controller: _confirmController,
            label: "Password".tr,
            hintColor: AppColor.lightGray,
            hintSize: 16,
            maxLines: 1,
            obscureText: !_confirmPasswordVisible,
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
                _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _confirmPasswordVisible = !_confirmPasswordVisible;
                });
              },
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          update.loading==false?
          constantbutton(onTap: () {
            if (_passController.text.isEmpty) {
              Utils.setSnackBar("Please enter login password".tr,AppColor.red, context);
            } else if (_passController.text.length < 6) {
              Utils.setSnackBar(
                  "The password must be at least 6 digits long.".tr,AppColor.red, context);
            }else if (_newController.text.isEmpty) {
              Utils.setSnackBar(
                  "Please enter new password".tr,AppColor.red, context);
            }
            else if (_newController.text.length < 6) {
              Utils.setSnackBar(
                  "The password must be at least 6 digits long.".tr,AppColor.red, context);
            } else if (_confirmController.text.isEmpty) {
              Utils.setSnackBar(
                  "Please enter confirm password".tr,AppColor.red, context);
            } else if (_confirmController.text.length < 6) {
              Utils.setSnackBar(
                  "The password must be at least 6 digits long.".tr,AppColor.red, context);
            }else{
              update.editPasswordApi(_passController.text,_newController.text,_confirmController.text, context) ;
            }

          }, text: 'Save changes'.tr,):
          CircularButton()
        ],
      ),
    );
  }
}
