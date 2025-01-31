import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/aboutus_view_model.dart';
import 'package:provider/provider.dart';

class CommonAboutPage extends StatefulWidget {
  const CommonAboutPage({super.key,});

  @override
  State<CommonAboutPage> createState() => _CommonAboutPageState();
}

class _CommonAboutPageState extends State<CommonAboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final notification = Provider.of<AboutUsViewModel>(context).aboutUsData?.data;
    final name=arguments['name'];
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: textWidget(
          text: name,
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: AppColor.white,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                notification?.description.toString() ?? "",
                textStyle: const TextStyle(color: AppColor.white, fontSize: 10),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
