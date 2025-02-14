import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/circular_button.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/pay_usdt_view_model.dart';
import 'package:game/view_model/usdt_deposit_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class UsdtDepositScreen extends StatefulWidget {
  const UsdtDepositScreen({super.key});

  @override
  State<UsdtDepositScreen> createState() => _UsdtDepositScreenState();
}

class _UsdtDepositScreenState extends State<UsdtDepositScreen> {
  File? _image;
  final picker = ImagePicker();
  String? base64Image;
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      base64Image = base64Encode(_image!.readAsBytesSync());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PayUsdtViewModel>(context,listen: false).userProfileApi(context);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String amount =arguments['amount'];
    final String usdt =arguments['usdt'];
    final usdtDeposit=Provider.of<UsdtDepositViewModel>(context);
    final pay=Provider.of<PayUsdtViewModel>(context).profileData?.data;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text(
          "USDT QR Deposit",
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          pay!=null? Container(
              height: height*0.3,
              child: Image.network(pay?[0].qrImage??"")):Container(),
          SizedBox(height: height*0.02,),
          Container(
            padding: EdgeInsets.all(10),
            height: height*0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
InkWell(
    onTap: (){
      Clipboard.setData(ClipboardData(text: pay?[0].usdtWalletAddress??""));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Wallet address copied successfully!")),
      );
    },
    child: Image(image: AssetImage(Assets.imagesCopy),color: AppColor.gray,)),
                Text(pay?[0].usdtWalletAddress??"")
              ],
            ),
          ),
          SizedBox(height: height*0.02,),
          ListTile(
            leading: Image(image: AssetImage(Assets.imagesUsdt)),
            title: Text("USDT amount $usdt",style: TextStyle(color: AppColors.whiteColor),),
            subtitle:Text("converted in INR $amount",style: TextStyle(color: AppColors.whiteColor),)
          ),
          SizedBox(height: height*0.02,),

          Container(
            alignment: Alignment.center,
            height: height*0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.whiteColor
            ),
            child: Text(amount)
          ),
          SizedBox(height: height*0.02,),

          InkWell(
              onTap: (){
                _settingModalBottomSheet(context);
              },
              child: Image(image: AssetImage(Assets.imagesAddAccount),height: height*0.06,)),
          Center(
            child: InkWell(
                onTap: (){
                  _settingModalBottomSheet(context);
                },
                child: Text("Upload screenshot",style: TextStyle(color: AppColors.whiteColor),)),
          ),
          SizedBox(height: height*0.02,),

          _image!=null? Container(
            height: height*0.1,
             child: Image.file(_image!),
           ):Container(),
          usdtDeposit.loading==false?  constantbutton(onTap: () {
            base64Image!=null? usdtDeposit.usdtDpositApi(amount,usdt, base64Image??"", context):Utils.setSnackBar("Upload your screenshot", AppColor.red, context);
          }, text: 'Deposit',):CircularButton()
        ],
      ),
    );
  }
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: AppColor.darkGray,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: height / 7,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width / 12, 0, width / 12, height / 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 2.7,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                          border: Border.all(color: AppColors.whiteColor, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                            'Camera',
                            style: TextStyle(color: AppColors.whiteColor),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 2.7,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.whiteColor, width: 2),

                          // color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                            'Gallery',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
