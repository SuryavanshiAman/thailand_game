import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class WinGoWallet extends StatefulWidget {
  const WinGoWallet({super.key});

  @override
  State<WinGoWallet> createState() => _WinGoWalletState();
}

class _WinGoWalletState extends State<WinGoWallet> {
  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<ProfileViewModel>(context);

    if (userProfileViewModel.profileData != null) {
      return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: AppColor.appBarGradient,
        borderRadius: BorderRadius.circular(15),
        image:  DecorationImage(
            image: AssetImage(Assets.imagesWalletBg), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                Assets.imagesGameWallet,
                height: 30,
                color: AppColor.white,
              ),
               textWidget(
                text: '  Wallet Balance',
                fontWeight: FontWeight.w500,
                color: AppColor.white,
                fontSize: 18,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Icon(Icons.currency_rupee_outlined,
                  size: 20, color: AppColor.white),
               textWidget(
                 text:
                 userProfileViewModel.profileData!.data!.wallet.toString(),
                fontSize: 20,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  userProfileViewModel.userProfileApi(context);
                  Utils.setSnackBar('Wallet refresh ✔',AppColor.white, context,);

                },
                child: Image.asset(Assets.imagesTotalBal, height: 30,color: AppColor.white,),
              ),
            ],
          ),
          const SizedBox(height: 10),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             constantbutton(
               height: height*0.04,
               width: width*0.4,
               onTap: (){
                 // Navigator.push(
                 //     context,
                 //     MaterialPageRoute(
                 //         builder: (context) => const Deposit()));
               },
               text: "Deposit",
               style:TextStyle(fontWeight:  FontWeight.bold,
               fontSize: 18,
               color: AppColor.white
               ),
             ),

             constantbutton(
               height: height*0.04,
               width: width*0.4,
               onTap: (){
                 // Navigator.push(
                 //     context,
                 //     MaterialPageRoute(
                 //         builder: (context) =>const Withdraw()));
               },
               text: "Withdraw", style:TextStyle(fontWeight:  FontWeight.bold,color: AppColor.white,
               fontSize: 18,),
             ),
           ],
         )
        ],
      ),
    );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
