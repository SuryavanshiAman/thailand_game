import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/utils.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/customer_service_view_model.dart';
import 'package:provider/provider.dart';

class CustomerCareService extends StatefulWidget {
  const CustomerCareService({super.key});

  @override
  State<CustomerCareService> createState() => _CustomerCareServiceState();
}

class _CustomerCareServiceState extends State<CustomerCareService> {




  @override
  void initState() {
    super.initState();
    Provider.of<CustomerServiceViewModel>(context,listen: false).customerServiceApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final customer=Provider.of<CustomerServiceViewModel>(context).setCustomerData?.data;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                )),
          ),
          centerTitle: true,
          title: textWidget(
            text: 'Customer service',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: AppColor.white,
          ),),
      body: Stack(
        //clipBehavior: Clip.none,
        children: [
          Container(
            height: height*0.28,
            width: width*999,
            decoration: const BoxDecoration(
              // gradient: AppColors.primaryUnselectedGradient,
              image: DecorationImage(image: AssetImage(Assets.imagesCustomerBg),fit: BoxFit.fill),),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.25,),
            child: Container(
              height: height*0.7,
              width: width*0.999,
              decoration: const BoxDecoration(
                  color: AppColor.darkGray,
                  // gradient: AppColors.primaryUnselectedGradient,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: customer?.length??0,
                  itemBuilder: (context,index){
                    final service = customer?[index];
                    return InkWell(
                      onTap: (){
                        Utils.launchURL(service?.link.toString()??"");
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: height*0.08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor
                        ),
                        child:ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(service?.image.toString()??""),
                            // child: Icon(Icons.telegram_outlined),
                          ),
                          title:  textWidget(
                            text: service?.name.toString()??"",
                            // fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: AppColor.black,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        )
                      ),
                    );
                  }),

            ),
          )
        ],
      ),
    );
  }

}
