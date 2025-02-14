

import 'package:game/generated/assets.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';


class ReferEarn extends StatefulWidget {
  const ReferEarn({Key? key, }) : super(key: key);
  @override
  State<ReferEarn> createState() => _ReferEarnState();
}
class _ReferEarnState extends State<ReferEarn> {
  bool KIsweb=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColor.black,
      appBar: GradientAppBar(
          leading: AppBackBtn(),
          centerTitle: true,
          title: textWidget(
            text: 'Refer & Earn',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: "SitkaSmall",
            color: AppColor.white,
          ),
          gradient: AppColor.appBarGradient),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 350,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.imagesReferearn),
                )
              // ,color: primaryColor
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'SHARE AND EARN MORE!',
            style: TextStyle(
                color: AppColor.white,
                fontSize: 20,
                fontFamily: "SitkaSmall",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
            child: Text("Invite your friend to use our app and you'll get 5% of the first deposit first time .This will be added to your bonus balance so,you use it to purchase any product.",
                style: TextStyle(color: AppColor.white, fontSize: 12,fontFamily: "SitkaSmall",)),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DottedBorder(
              color: AppColor.white,
              strokeWidth: 2,
              radius: const Radius.circular(12),
              dashPattern: const [
                5,
                5,
              ],
              child: Container(

                alignment: Alignment.center,
                height: 40,

                color: AppColor.gray,
                child: Text(
                  "25468",

                  style: const TextStyle(

                    color: AppColor.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                height: 35,
                width: 170,
                decoration: BoxDecoration(
                  color:AppColor.gray ,
                  border: Border.all(width: 1, color: AppColor.darkGray),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child:
                InkWell(
                  onTap: ()async {
                    share();
                  },
                  child: const Row  (
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.darkGray,
                          child: Icon(
                            Icons.share,
                            color: AppColor.white,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Share the code",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // REFER_EARN();
    super.initState();
  }
  var map;

  // REFER_EARN() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid = prefs.getString("userId");
  //   final response =  await http.post(
  //     Uri.parse(ApiConst.referEarn),
  //     headers:<String ,String>{
  //       "Content-Type":"application/json; charset=UTF-8",
  //     },
  //     body: jsonEncode(<String ,String>{
  //       "userid": '$userid',
  //
  //     }),
  //   );
  //   var data = jsonDecode(response.body);
  //   if (data['status'] == '200') {
  //     setState(() {
  //       map = data;
  //
  //     });
  //
  //   }
  // }

  // String referralCode = 'initialData';
  Future<void> share() async {

    await Share.share(
        'Join Now & Get Exiting Prizes. here is my Referral Code'
            ' https://root.worldtradeshiping.co.in/?id=${map['refer_code']}',
        subject: 'Referral Code : ' + map['refer_code']);

  }

  void copyToClipboard(String code, BuildContext context) {
    Clipboard.setData(
      ClipboardData(
        text: code,

      ),
    ).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Copied to clipboard'),
        ),
      ),
    );
  }
}
