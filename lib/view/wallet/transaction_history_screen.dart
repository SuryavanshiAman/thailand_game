import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/main.dart';
import 'package:game/model/transaction_history_model.dart';
import 'package:game/model/transaction_model.dart';
import 'package:game/res/app_colors.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/filter_date-formate.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/transaction_history_view_model.dart';
import 'package:game/view_model/transaction_type_view_model.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionTypeViewModel>(context,listen: false).transactionTypeApi(context);
    Provider.of<TransactionHistoryViewModel>(context,listen: false).transactionApi("","",context);
  }
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<TransactionHistoryViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text("Transaction History",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),

      ),
      body: ListView(
        children: [
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
                    height: height * 0.08,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.darkGray,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
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
                ),
                Center(
                  child: Container(
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
                            history.transactionApi("", DateFormat('yyy-MM-dd').format(selectedDate), context);
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
          history.transactionData!.data!.isNotEmpty?
          SizedBox(
            height: height*0.75,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: history.transactionData?.data?.length??0,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, int index) {
                final data =history.transactionData?.data?[index];
                return withdrawCard(data!,context);
              },
            ),
          ):
          Padding(
            padding:  EdgeInsets.only(top: height*0.15),
            child: Center(
              child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset('assets/lottie/no_data.json',fit: BoxFit.fill,),
                  ),
            ),
          ),

        ],
      ),
    );
  }
  Widget withdrawCard(Transaction data, BuildContext context) {
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
          Text(
            typeName.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
          buildRow("Detail",data.description?.toString()??"", AppColors.whiteColor),
          buildRow("Time", data.createdAt!, AppColors.whiteColor),
          buildRow("balance",data.amount.toString(),  Colors.green),

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
    final type = Provider.of<TransactionTypeViewModel>(context,listen: false);
    final history = Provider.of<TransactionHistoryViewModel>(context,listen: false);
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
                      setState(() {
                      }); // Update main screen
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
              itemCount: type.transactionTypeData?.data?.length??0,
              itemBuilder: (BuildContext context, int index) {
                final transaction = type.transactionTypeData?.data?[index];
                return InkWell(
                  onTap: () {
                    setModalState(() {
                      selectedId = index;
                      typeName = transaction?.name.toString()??"";
                    });
                    history.transactionApi(transaction?.id, "", context);
                    if (kDebugMode) {
                      print(selectedId);
                    }
                  },
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          transaction?.name??"",
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
