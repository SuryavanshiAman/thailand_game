// import 'package:flutter/material.dart';
// import 'package:game/main.dart';
// import 'package:game/res/color-const.dart';
// import 'package:game/res/custom_text_field.dart';
// import 'package:game/view/game/Aviator/res/app_button.dart';
// import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
// import 'package:game/view_model/choose_bank_view_model.dart';
// import 'package:iconly/iconly.dart';
// import 'package:provider/provider.dart';
//
// class ChooseBankScreen extends StatefulWidget {
//   const ChooseBankScreen({super.key});
//
//   @override
//   State<ChooseBankScreen> createState() => _ChooseBankScreenState();
// }
//
// class _ChooseBankScreenState extends State<ChooseBankScreen> {
//   final TextEditingController _bankController = TextEditingController();
// @override
//   void initState() {
//     // TODO: implement initState
//     Provider.of<ChooseBankViewModel>(context,listen: false).chooseBankApi(context);
//
//   }
//   @override
//   Widget build(BuildContext context) {
//   final bankName=Provider.of<ChooseBankViewModel>(context).bankNameData?.data;
//     return Scaffold(
//       backgroundColor: AppColor.black,
//       appBar: GradientAppBar(
//         leading: AppBackBtn(),
//         centerTitle: true,
//         title: Text(
//           "Choose a bank",
//           style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
//         ),
//
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         padding: EdgeInsets.all(20),
//         physics: NeverScrollableScrollPhysics(),
//         children: [
//           CustomTextField(
//             controller: _bankController,
//             label: "Search bank",
//             hintColor: AppColor.lightGray,
//             hintSize: 16,
//             height: 55,
//             borderSide: BorderSide(color: Colors.white),
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             width: width * 0.65,
//             filled: true,
//             fillColor: AppColor.gray.withOpacity(0.5),
//             border: Border.all(color: AppColor.gray.withOpacity(0.3)),
//             borderRadius: BorderRadius.circular(15),
//             fieldRadius: BorderRadius.circular(15),
//             prefix: Icon(IconlyLight.search,color: AppColor.white,),
//
//           ),
//           SizedBox(height: height*0.02,),
//           Container(
//             height: height,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: AppColor.darkGray,
//               borderRadius: BorderRadius.circular(15)
//             ),
//             child:Column(
//               // shrinkWrap: true,
//               // physics: NeverScrollableScrollPhysics(),
//               children: [
//                 Text("Choose a bank",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall",fontWeight: FontWeight.w600,fontSize: 16),),
//                 Divider(color: AppColor.lightGray,),
//                 SizedBox(
//                   height: height*0.7,
//                   child: ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount:bankName?.length??0,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(bankName?[index].bankName??"",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),
//                           Divider(color: AppColor.lightGray,),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/choose_bank_view_model.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ChooseBankScreen extends StatefulWidget {
  const ChooseBankScreen({super.key});

  @override
  State<ChooseBankScreen> createState() => _ChooseBankScreenState();
}

class _ChooseBankScreenState extends State<ChooseBankScreen> {
  final TextEditingController _bankController = TextEditingController();
  List<dynamic> _filteredBanks = [];

  @override
  void initState() {
    super.initState();
    final bankViewModel = Provider.of<ChooseBankViewModel>(context, listen: false);

    // Fetch data when the page loads
    bankViewModel.chooseBankApi(context).then((_) {
      if (mounted) {
        setState(() {
          _filteredBanks = bankViewModel.bankNameData?.data ?? [];
        });
      }
    });

    _bankController.addListener(_filterBanks);
  }

  void _filterBanks() {
    final bankViewModel = Provider.of<ChooseBankViewModel>(context, listen: false);
    final searchQuery = _bankController.text.toLowerCase();

    setState(() {
      _filteredBanks = bankViewModel.bankNameData?.data
          ?.where((bank) => bank.bankName!.toLowerCase().contains(searchQuery))
          .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          "Choose a bank".tr,
          style: TextStyle(color: AppColor.white, fontFamily: "SitkaSmall"),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: _bankController,
            label: "Search bank".tr,
            hintColor: AppColor.lightGray,
            hintSize: 16,
            height: 55,
            borderSide: BorderSide(color: Colors.white),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: width * 0.65,
            filled: true,
            fillColor: AppColor.gray.withOpacity(0.5),
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
            prefix: Icon(IconlyLight.search, color: AppColor.white),
          ),
          SizedBox(height: height * 0.02),
          Container(
            height: height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.darkGray,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  "Choose a bank".tr,
                  style: TextStyle(
                    color: AppColor.white,
                    fontFamily: "SitkaSmall",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Divider(color: AppColor.lightGray),
                Expanded(
                  child: Consumer<ChooseBankViewModel>(
                    builder: (context, bankViewModel, child) {
                      final banks = _bankController.text.isEmpty
                          ? bankViewModel.bankNameData?.data ?? []
                          : _filteredBanks;

                      if (banks.isEmpty) {
                        return Center(
                          child: Text(
                            "No banks available".tr,
                            style: TextStyle(color: AppColor.white),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: banks.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  bankViewModel.setBank(banks[index].bankName);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  banks[index].bankName ?? "",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontFamily: "SitkaSmall",
                                  ),
                                ),
                              ),
                              Divider(color: AppColor.lightGray),
                            ],
                          );
                        },
                      );
                    },
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

