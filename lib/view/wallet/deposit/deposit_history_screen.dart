import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/main.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/filter_date-formate.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/deposit_view_model.dart';
import 'package:provider/provider.dart';

class DepositHistoryScreen extends StatefulWidget {
  const DepositHistoryScreen({super.key});

  @override
  State<DepositHistoryScreen> createState() => _DepositHistoryScreenState();
}

class _DepositHistoryScreenState extends State<DepositHistoryScreen> {
  int? selectedCatIndex;
  int selectedId = 0;
  String typeName = 'All';
  DateTime? _selectedDate;
  final ScrollController _scrollController = ScrollController();
  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 100.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deposit = Provider.of<DepositViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text("Deposit History",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),

      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            margin: EdgeInsets.only(top: height*0.02),
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            height: 80,
            // width: width * 0.93,
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: deposit.paymentOptions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final items=deposit.paymentOptions[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCatIndex = index;
                      });
                      scrollToIndex(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      // height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          color: selectedCatIndex != index
                              ? AppColor.gray
                              : AppColor.lightGray.withOpacity(0.4),
                      gradient: selectedCatIndex != index
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
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.1),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('${items['image']}'),
                            height: 25,

                          ),
                          textWidget(
                            text: items['title'],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setModalState) { // setModalState to refresh bottom sheet
                            return allTransactionType(context, setModalState);
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    height: height * 0.08,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        color: AppColor.darkGray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width*0.3,
                          child: textWidget(
                            text: typeName,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: AppColors.dividerColor,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.dividerColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    height: height*0.08,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        color: AppColor.darkGray,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                            text:   _selectedDate==null?'Select date':
                            '   ${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                            fontSize: 18,
                            color: AppColors.primaryTextColor),
                        FilterDateFormat(
                          onDateSelected: (DateTime selectedDate) {


                            setState(() {
                              _selectedDate = selectedDate;
                            });
                            // depositHistory();
                            // commissionDetailsApi();
                            if (kDebugMode) {
                              print('Selected Date: $selectedDate');
                              print('object');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: deposit.transactionsHistory
                .map((transaction) => depositCard(transaction, context))
                .toList(),
          ),
        ],
      ),
    );
  }
  Widget depositCard(Map<String, String> transaction, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10,top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.blue.shade900,
        gradient: AppColor.appBarGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Deposit",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "To be paid",
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: width,
            margin: EdgeInsets.only(top: 5, bottom: 20),
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  AppColor.white,
                  Colors.black,
                  // Color(0xFFE3BE46),
                  AppColor.white,
                  Colors.black
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          buildRow("Balance", transaction["balance"]!, Colors.green),
          buildRow("Type", transaction["type"]!, Colors.white),
          buildRow("Time", transaction["time"]!, Colors.white),
          buildRow("Order number", transaction["orderNumber"]!, Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: transaction["orderNumber"]!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Copied Order Number!")),
                  );
                },
                icon: Icon(Icons.copy, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildRow(String title, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title  ",
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(color: valueColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
  Widget allTransactionType(BuildContext context, void Function(void Function()) setModalState) {
    final deposit = Provider.of<DepositViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.black,
            AppColor.gray,
            AppColor.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: height * 0.35,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: AppColor.darkGray,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: textWidget(
                      text: 'Cancel',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.dividerColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {}); // Update main screen
                      Navigator.pop(context);
                    },
                    child: textWidget(
                      text: 'Confirm',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: height * 0.03),
              shrinkWrap: true,
              itemCount: deposit.transactionType.length,
              itemBuilder: (BuildContext context, int index) {
                final type = deposit.transactionType[index];
                return InkWell(
                  onTap: () {
                    setModalState(() { // Use setModalState to update selection inside the bottom sheet
                      selectedId = index;
                      typeName = type.toString();
                    });

                    if (kDebugMode) {
                      print(selectedId);
                    }
                  },
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          type,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: selectedId == index ? Colors.blue : AppColor.white,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
