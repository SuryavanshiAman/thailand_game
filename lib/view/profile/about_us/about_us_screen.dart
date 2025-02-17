import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/aboutus_view_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aboutus=Provider.of<AboutUsViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: textWidget(
          text: 'About Us'.tr,
          fontFamily: "SitkaSmall",
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: AppColor.white,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.2,
            width: width,
            // color: Colors.red,
            decoration: const BoxDecoration(
              gradient: AppColor.gradient,
              image: DecorationImage(
                image: AssetImage(Assets.imagesAboutUs),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Column(
            children: [
              ListTile(
                tileColor: AppColor.gray,
                leading: Image.asset(
                  Assets.imagesPrivacy,
                  height: height * 0.05,
                  color: AppColor.white,
                ),
                title: textWidget(
                  text: 'Confidentiality Agreement'.tr,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SitkaSmall",
                  fontSize: 15,
                  color: AppColor.white,
                ),
                trailing: IconButton(
                  onPressed: () {
                    aboutus.aboutUsApi("1",context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColor.lightGray,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ListTile(
                tileColor: AppColor.gray,
                leading: Image.asset(
                  Assets.imagesRisk,
                  height: height * 0.05,
                  color: AppColor.white,
                ),
                title: textWidget(
                  text: 'Risk Disclosure Agreement'.tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: "SitkaSmall",
                  color: AppColor.white,
                ),
                trailing: IconButton(
                  onPressed: () {
                    aboutus.aboutUsApi("2",context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColor.lightGray,
                    size: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
