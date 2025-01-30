import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/shimmer.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/deposit_view_model.dart';
import 'package:game/view_model/profile_view_model.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  int selectedIndex = 0;
  int selectedIndexTwo = 0;
  int type = 0;
  TextEditingController amount = TextEditingController();
  int _selectedItemIndex =
      10; // Initialize with a value that won't match any index
  bool _isButtonEnabled = false;
  List<int> indianAmount = [10000, 50000, 100000, 200000, 500000, 5000000];
  List<int> usdAmount = [10, 500, 1000, 2000, 5000, 50000];
  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    print(index);
    setState(() {
      _selectedItemIndex = type == 3 ? usdAmount[index] : indianAmount[index];
      amount.text = type == 3
          ? usdAmount[index].toString()
          : indianAmount[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deposit = Provider.of<DepositViewModel>(context);
    final profile = Provider.of<ProfileViewModel>(context).profileData?.data;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text(
          "Deposit",
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.depositHistoryScreen);
            },
            child: Text(
              "Deposit history",
              style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: height * 0.17,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(
                      Assets.imagesCardImage,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      IconlyBold.wallet,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontFamily: "SitkaSmall",
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    // Icon(IconlyBold.wallet,color: AppColor.white,),
                    // ,
                    SizedBox(
                      width: width * 0.12,
                    ),
                    Text(
                      "₹${profile?.depositAmount??"0.0"}",
                      style: TextStyle(
                          fontFamily: "SitkaSmall",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColor.white),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Image.asset(
                      Assets.imagesTotalBal,
                      scale: 1.4,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.3,
            margin: EdgeInsets.only(top: height * 0.025),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 16,
                childAspectRatio: 1.7,
              ),
              itemCount: deposit.paymentOptions.length,
              itemBuilder: (context, index) {
                final option = deposit.paymentOptions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      type=index;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: selectedIndex==index?AppColor.black.withOpacity(0.3):null,
                          border: Border.all(
                              color: selectedIndex != index
                                  ? AppColor.gray
                                  : AppColor.lightGray.withOpacity(0.4)),
                          gradient: selectedIndex != index
                              ? LinearGradient(
                                  colors: [
                                    AppColor.black,
                                    AppColor.gray,
                                    AppColor.black,
                                  ],
                                  // stops: [0.1, 0.9,],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                          boxShadow: [
                            selectedIndex == index
                                ? BoxShadow(
                                    color: AppColor.lightGray.withOpacity(0.3),
                                    blurRadius: 2,
                                    offset: Offset(3, 4),
                                  )
                                : BoxShadow(),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(option['image'], height: 40),
                                  SizedBox(height: 8),
                                  Text(
                                    option['title'],
                                    style: TextStyle(
                                        color: AppColor.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            if (option.containsKey('badge'))
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    option['badge'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Shimmer.fromColors(
                        period: Duration(seconds: 6),
                        baseColor:Colors.transparent,
                        highlightColor:AppColor.white.withOpacity(0.3),
                        child: Container(
                          // margin: EdgeInsets.only(top: height*0.02),
                          height: height * 0.12,
                          // width: width * 0.5,
                          decoration: const BoxDecoration(
                            color: Colors
                                .blue, // Replace with your secondary color
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: AppColor.darkGray,
                border: Border.all(color: AppColor.gray),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      IconlyBroken.wallet,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text("Deposit amount",
                        style: TextStyle(
                            fontFamily: "SitkaSmall",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white)),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 130,
                            crossAxisSpacing: 10,
                            childAspectRatio: 3.5 / 1.33,
                            mainAxisSpacing: 10),
                    itemCount:
                        type == 3 ? usdAmount.length : indianAmount.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndexTwo = index;
                            _handleListItemSelected(index);
                          });

                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: selectedIndexTwo == index
                                    ? AppColor.white.withOpacity(0.3)
                                    : null,
                                border: Border.all(color: AppColor.gray),
                                gradient: selectedIndexTwo != index
                                    ? LinearGradient(
                                        colors: [
                                          AppColor.black,
                                          AppColor.gray,
                                          AppColor.black,
                                        ],
                                        // stops: [0.1, 0.9,],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  type == 3
                                      ? '\$ ${usdAmount[index]}'
                                      : '₹  ${indianAmount[index]}',
                                  style: TextStyle(
                                      color: _selectedItemIndex ==
                                                  indianAmount[index] ||
                                              _selectedItemIndex ==
                                                  usdAmount[index]
                                          ? AppColor.white
                                          : AppColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 16,
                ),
                Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: TextField(
                    controller: amount,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: AppColor.black, fontWeight: FontWeight.w600),
                    onChanged: (text) {
                      _handleTextChange();
                    },
                    decoration: InputDecoration(
                        // filled: true,
                        //   fillColor:lightGray,
                        prefixIcon: SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Icon(
                                type != 3
                                    ? Icons.currency_rupee
                                    : Icons.currency_exchange,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10),
                              Container(
                                  height: 30, color: Colors.grey, width: 2)
                            ],
                          ),
                        ),
                        hintText: "Enter Amount",
                        helperStyle: TextStyle(
                            fontSize: 10, color: Colors.grey.shade200),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColor.gray),
                          borderRadius: BorderRadius.circular(25),
                        )),
                    cursorColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                constantbutton(
                    width: width * 0.8, onTap: () {}, text: "Deposit"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width * 0.9,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.darkGray,
              border: Border.all(color: AppColor.gray),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(IconlyBroken.info_circle, color: AppColor.white),
                    SizedBox(width: 8),
                    Text(
                      'Recharge instructions',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                          fontFamily: "SitkaSmall"),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                InstructionItem(
                  text:
                      'If the transfer time is up, please fill out the deposit form again.',
                ),
                InstructionItem(
                  text:
                      'The transfer amount must match the order you created, otherwise the money cannot be credited successfully.',
                ),
                InstructionItem(
                  text:
                      'If you transfer the wrong amount, our company will not be responsible for the lost amount!',
                ),
                InstructionItem(
                  text:
                      'Note: do not cancel the deposit order after the money has been transferred.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionItem extends StatelessWidget {
  final String text;
  const InstructionItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '◆ ',
            style: TextStyle(color: AppColor.white, fontSize: 18),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
