import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';


class UsdtAddress extends StatefulWidget {
  const UsdtAddress({super.key});

  @override
  State<UsdtAddress> createState() => _UsdtAddressState();
}

class _UsdtAddressState extends State<UsdtAddress> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text(
          "Add USDT address",
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.darkGray,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: [
                // Icon(Icons., color: Colors.red),
                Image.asset(Assets.imagesInfo,scale: 1.5,),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'To ensure the safety of your funds, please bind your bank account',
                    style: TextStyle(color: AppColor.red, fontSize: 14,fontFamily: "SitkaSmall"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Choose a bank section
          Row(
            children: [
              Icon(Icons.account_balance, color: AppColor.white),
              SizedBox(width: 10),
              Text(
                'Select main network',
                style: TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TRC',
                  style: TextStyle(color: AppColor.white, fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down_outlined, color:AppColor.white, size: 18),
              ],
            ),
          ),
          SizedBox(height: height*0.03),
          // Recipient's name section
          rowWidget(Assets.imagesPeople,'Full recipient\'s name'),
          SizedBox(height: height*0.02),
          CustomTextField(
            controller: _addressController,
            label: "Enter the USDT address",
            hintColor: AppColor.lightGray,
            hintSize: 16,
            height: 55,
            borderSide: BorderSide(color: Colors.white),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: width,
            filled: true,
            fillColor: AppColor.gray.withOpacity(0.5),
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
            prefix: Icon(Icons.currency_rupee, color: AppColor.white),
          ),
          SizedBox(height: height*0.03),
          // Recipient's name section
          rowWidget(Assets.imagesBankCard,'Bank account number'),
          SizedBox(height: height*0.02),
          CustomTextField(
            controller: _aliasController,
            label: "Enter the remark ot the withdrawal address",
            hintColor: AppColor.lightGray,
            hintSize: 16,
            height: 55,
            borderSide: BorderSide(color: Colors.white),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: width,
            filled: true,
            fillColor: AppColor.gray.withOpacity(0.5),
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
            prefix: Icon(Icons.currency_rupee, color: AppColor.white),
          ),

          SizedBox(height: height*0.03),
          constantbutton(onTap: () {  }, text: 'Save',),
        ],
      ),
    );
  }
  Widget rowWidget(String image, String text ){
    return Row(
      children: [
        Image.asset(image,color: AppColor.white,scale: 2,),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
