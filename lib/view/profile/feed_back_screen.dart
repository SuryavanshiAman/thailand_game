import 'package:flutter/material.dart';
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
import 'package:game/view_model/feed_back_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final TextEditingController _feedBackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final feedBack = Provider.of<FeedBackViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: textWidget(
          text: 'Feedback',
          fontFamily: "SitkaSmall",
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: AppColor.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: _feedBackController,
            label:
                'Welcome to feedback, please give feedback-please describe the problem in detail when providing feedback, preferably attach a screenshot of the problem you encountered, we will immediately process your feedback!',
            hintColor: AppColor.lightGray,
            hintSize: 16,
            height: 280,
            borderSide: BorderSide(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: width * 0.65,
            maxLines: 10,
            filled: true,
            fillColor: AppColor.gray.withOpacity(0.5),
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
              textAlign: TextAlign.center,
              "Send helpful feedback\n Chance to win Mystery Rewards",
              style: TextStyle(
                  fontFamily: "SitkaSmall",
                  color: AppColor.white,
                  fontSize: 16)),
          Lottie.asset(Assets.lottieFeedBack, height: height * 0.25),
          feedBack.loading==false?  constantbutton(
            onTap: () {
              if (_feedBackController.text.isEmpty) {
                Utils.setSnackBar(
                    "Please enter the feedback", AppColor.red, context);
              } else {
                feedBack.feedBackApi(_feedBackController.text, context);
              }
            },
            text: 'Submit',
          ):CircularButton()
        ],
      ),
    );
  }
}
