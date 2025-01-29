import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/res/shimmer.dart';
import 'package:game/utils/routes/routes_name.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/withdraw_view_model.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  int selectedIndex = 0;
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final withdraw = Provider.of<WithdrawViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text(
          "Withdraw",
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.withdrawHistoryScreen);
            },
            child: Text(
              "Withdrawal history",
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
                borderRadius: BorderRadius.circular(15),
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
                      "Available balance",
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
                      "₹1000",
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
            height: height * 0.15,
            margin: EdgeInsets.only(top: height * 0.025),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 16,
                childAspectRatio: 1.7,
              ),
              itemCount: withdraw.withdrawOptions.length,
              itemBuilder: (context, index) {
                final option = withdraw.withdrawOptions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(option['image'], height: 40),
                              SizedBox(height: 8),
                              Text(
                                option['title'],
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontFamily: "SitkaSmall"),
                              ),
                            ],
                          ),
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
          InkWell(
            onTap: (){
              selectedIndex==0?
              Navigator.pushNamed(context, RoutesName.bankScreen):Navigator.pushNamed(context, RoutesName.usdtAddress);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.darkGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesAddAccount,
                    scale: 3,
                  ),
                  // Icon(Icons.add_box_outlined, color: Colors.grey, size: 50),
                  SizedBox(height: 10),
                  Text(
                    selectedIndex != 1
                        ? 'Add a bank account number'
                        : "Add address",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "SitkaSmall"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Need to add beneficiary information to be able to withdraw money',
            style: TextStyle(
                color: Colors.red, fontSize: 14, fontFamily: "SitkaSmall"),
          ),
          SizedBox(height: 20),
          // Enter Amount Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.darkGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectedIndex == 1
                    ? Row(
                        children: [
                          Image.asset(
                            Assets.imagesUsdt,
                            scale: 2,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            'Select amount of USDT',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "SitkaSmall"),
                          ),
                        ],
                      )
                    : Container(),
                selectedIndex == 1
                    ? SizedBox(height: height * 0.02)
                    : Container(),
                CustomTextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  label: "Enter the amount",
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
                SizedBox(height: height * 0.02),
                selectedIndex == 1
                    ? CustomTextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        label: "Enter USDT amount",
                        hintColor: AppColor.lightGray,
                        hintSize: 16,
                        height: 55,
                        borderSide: BorderSide(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        width: width,
                        filled: true,
                        fillColor: AppColor.gray.withOpacity(0.5),
                        border:
                            Border.all(color: AppColor.gray.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(15),
                        fieldRadius: BorderRadius.circular(15),
                        prefix: Image.asset(
                          Assets.imagesUsdt,
                          scale: 2.3,
                        ),
                      )
                    : Container(),
                selectedIndex == 1
                    ? SizedBox(height: height * 0.02)
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Withdrawable balance ₹0.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "SitkaSmall"),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.black,
                            AppColor.gray,
                            AppColor.black,
                          ],
                          // stops: [0.1, 0.9,],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                            fontFamily: "SitkaSmall"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                selectedIndex == 1
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Withdrawal amount received',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "SitkaSmall"),
                          ),
                          Text(
                            '₹0.00',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                selectedIndex == 1 ? SizedBox(height: 16) : Container(),
                SizedBox(height: height * 0.02),
                constantbutton(width: width, onTap: () {}, text: "Withdraw"),
                SizedBox(height: height * 0.03),
                // Withdrawal Instructions
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColor.gray),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InstructionItem(
                        text: 'Need to bet ₹0.00 to be able to withdraw',
                      ),
                      InstructionItem(
                        text: 'Withdraw time 00:00-23:59',
                      ),
                      InstructionItem(
                        text: 'Inday Remaining Withdrawal Times3',
                      ),
                      InstructionItem(
                        text: 'Withdrawal amount range ₹110.00-₹50,000.00',
                      ),
                      InstructionItem(
                        text:
                            'Please confirm your beneficial account information before withdrawing. If your information is incorrect, our company will not be liable for the amount of loss',
                      ),
                      InstructionItem(
                        text:
                            'If your beneficial information is incorrect, please contact customer service',
                      ),
                    ],
                  ),
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
                  fontFamily: "SitkaSmall"),
            ),
          ),
        ],
      ),
    );
  }
}
