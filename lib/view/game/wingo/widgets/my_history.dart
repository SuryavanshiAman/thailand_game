// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:game/main.dart';
// import 'package:game/res/color-const.dart';
// import 'package:game/res/constantButton.dart';
// import 'package:game/res/text_widget.dart';
// import 'package:game/view/game/wingo/res/size_const.dart';
// import 'package:game/view/game/wingo/view_model/win_go_my_his_view_model.dart';
// import 'package:provider/provider.dart';
//
// class WingoMyHis extends StatefulWidget {
//   const WingoMyHis({super.key});
//
//   @override
//   State<WingoMyHis> createState() => _WingoMyHisState();
// }
//
// class _WingoMyHisState extends State<WingoMyHis> {
//   int currentOffset = 0;
//   int pageValue = 1;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_){
//       final winGoHisViewModel =
//       Provider.of<WinGoMyHisViewModel>(context, listen: false);
//       winGoHisViewModel.myBetHisApi(context,currentOffset);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final winGoHisViewModel =
//         Provider.of<WinGoMyHisViewModel>(context,);
//     if (winGoHisViewModel.winGoMyHisModelData != null &&
//         winGoHisViewModel.winGoMyHisModelData!.data!.isNotEmpty) {
//       return Column(
//         children: [
//           Expanded(
//             child: Container(
//               height: height*0.5,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: winGoHisViewModel.winGoMyHisModelData!.data!.length,
//                 itemBuilder: (context, index) {
//                   final betHistoryData =
//                       winGoHisViewModel.winGoMyHisModelData!.data![index];
//                   final color = betHistoryData.number == 0
//                       ? [Colors.red, Colors.purple]
//                       : betHistoryData.number == 5
//                           ? [Colors.green, Colors.purple]
//                           : betHistoryData.number == 10
//                               ? [Colors.green, Colors.green]
//                               : betHistoryData.number == 20
//                                   ? [Colors.purple, Colors.purple]
//                                   : betHistoryData.number == 30
//                                       ? [Colors.red, Colors.red]
//                                       : betHistoryData.number == 40
//                                           ? [Colors.orange, Colors.orange]
//                                           : betHistoryData.number == 50
//                                               ? [Colors.blue, Colors.blue]
//                                               : (betHistoryData.number == 2 ||
//                                                       betHistoryData.number == 4 ||
//                                                       betHistoryData.number == 6 ||
//                                                       betHistoryData.number == 8)
//                                                   ? [Colors.red, Colors.red]
//                                                   : [Colors.green, Colors.green];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Theme(
//                       data: Theme.of(context)
//                           .copyWith(dividerColor: Colors.transparent),
//                       child: ExpansionTile(
//                         leading: Container(
//                           alignment: Alignment.center,
//                           height: height * 0.066,
//                           width: width * 0.15,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(
//                               colors: color,
//                               stops: const [0.5, 0.5],
//                               begin: Alignment.bottomLeft,
//                               end: Alignment.topRight,
//                             ),
//                           ),
//                           child:  textWidget(
//
//                             textAlign: TextAlign.center,
//                               text: betHistoryData.number == 10
//                                 ? 'G'
//                                 : betHistoryData.number == 20
//                                     ? 'V'
//                                     : betHistoryData.number == 30
//                                         ? 'R'
//                                         : betHistoryData.number == 40
//                                             ? 'B'
//                                             : betHistoryData.number == 50
//                                                 ? 'S'
//                                                 : betHistoryData.number.toString(),
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.white,
//                           ),
//                         ),
//                         title: textWidget(
//
//                           textAlign: TextAlign.center,
//                           text: betHistoryData.gamesNo.toString(),
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.white,
//                         ),
//                         subtitle: textWidget(
//
//                           textAlign: TextAlign.center,
//                           text: betHistoryData.createdAt,
//                           fontSize: 10,
//                           color: AppColor.white,
//                         ),
//                         trailing: Column(
//                           children: [
//                             constantbutton(
//                               height: height * 0.04,
//                               width: width * 0.2,
//                               text: betHistoryData.status == 0
//                                   ? "Pending"
//                                   : betHistoryData.status == 1
//                                       ? "Success"
//                                       : "Failed",
//                               style: TextStyle(
//                                 // color: Colors.red,
//                                 fontWeight: FontWeight.bold,
//                                 color: betHistoryData.status == 0
//                                     ? Colors.orange
//                                     : betHistoryData.status == 1
//                                     ? Colors.green
//                                     : Colors.red,
//                                 fontSize: 12,
//                               ),
//
//                               gradient: AppColor.transparentGradient,
//                               border: Border.all(
//                                 color: betHistoryData.status == 0
//                                     ? Colors.orange
//                                     : betHistoryData.status == 1
//                                         ? Colors.green
//                                         : Colors.red,
//                               ), onTap: () {  },
//                             ),
//                             Sizes.spaceHeight5,
//                             textWidget(
//                               text: "🪙 ${(betHistoryData.status == 1?betHistoryData.winAmount:betHistoryData.amount).toStringAsFixed(2)}",
//                               fontSize: 12,
//                               color: betHistoryData.status == 0
//                                   ? Colors.orange
//                                   : betHistoryData.status == 1
//                                       ? Colors.green
//                                       : Colors.red,
//                             ),
//                           ],
//                         ),
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                  Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: textWidget(
//                                     text:  "",
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: AppColor.orange,
//                                   ),
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Order Number",
//                                   betHistoryData.orderId.toString(),
//                                   Colors.orangeAccent,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Period",
//                                   betHistoryData.gamesNo.toString(),
//                                   Colors.orangeAccent,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Purchase Amount",
//                                   "🪙${betHistoryData.amount}",
//                                   Colors.white,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Amount after TAX",
//                                   "🪙 ${betHistoryData.tradeAmount}",
//                                   Colors.green,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "TAX",
//                                   "🪙 ${betHistoryData.commission}",
//                                   Colors.green,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Result",
//                                   betHistoryData.winNumber.toString(),
//                                   Colors.green,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Select",
//                                   betHistoryData.winNumber.toString(),
//                                   Colors.green,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Status",
//                                   betHistoryData.status == 0
//                                       ? "Pending"
//                                       : betHistoryData.status == 1
//                                           ? "Success"
//                                           : "Failed",
//                                   Colors.red,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Win/Loss",
//                                   "🪙 ${betHistoryData.winAmount.toStringAsFixed(2)}",
//                                   Colors.red,
//                                 ),
//                                 wingoGameHistoryDetail(
//                                   "Order Time",
//                                   betHistoryData.createdAt.toString(),
//                                   Colors.green,
//                                 ),
//                                 SizedBox(height: height * 0.01),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   if (pageValue != 1) {
//                     _decrementData(winGoHisViewModel);
//                   }
//                 },
//                 child: Container(
//                   height: height * 0.06,
//                   width: width * 0.10,
//                   decoration: BoxDecoration(
//                     gradient: pageValue ==1
//                         ? AppColor.boxGradient:AppColor.appBarGradient,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Icon(
//                     Icons.navigate_before,
//                     color: AppColor.white,
//                   ),
//                 ),
//               ),
//               Sizes.spaceWidth15,
//               Row(
//                 children: [
//                   Text(
//                     pageValue.toString(),
//                     style: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.white,
//                     ),
//                   ),
//                   const Text(
//                     '/',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.white,
//                       // maxLines: 1,
//                     ),
//                   ),
//                   Text(
//                     (((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1).toString(),
//                     style: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.white,
//                       // maxLines: 1,
//                     ),
//                   ),
//                 ],
//               ),
//               Sizes.spaceWidth15,
//               GestureDetector(
//                 onTap: () {
//                   if (pageValue !=
//                       ((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1) {
//                     _incrementData(winGoHisViewModel);
//                   }
//                 },
//                 child: Container(
//                   height: height * 0.06,
//                   width: width * 0.10,
//                   decoration: BoxDecoration(
//                     gradient: pageValue ==
//                         ((winGoHisViewModel.winGoMyHisModelData!.totalBets! -
//                             1) ~/
//                             10) +
//                             1
//                         ? AppColor.boxGradient:AppColor.appBarGradient,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child:  const Icon(Icons.navigate_next,
//                       color: AppColor.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     } else {
//       return Container(
//           height: height * 0.2,
//           width: width,
//           alignment: Alignment.center,
//           child: const Text('No data available!',
//               style: TextStyle(color: Colors.white)));
//     }
//   }
//
//   void _updateData(int increment, WinGoMyHisViewModel winGoHisViewModel) {
//     if (winGoHisViewModel.winGoMyHisModelData!.totalBets != null &&
//         winGoHisViewModel.winGoMyHisModelData!.totalBets != null) {
//       int countValue = winGoHisViewModel.winGoMyHisModelData!.totalBets!;
//       if ((currentOffset + increment >= 0) &&
//           (currentOffset + increment < countValue)) {
//         currentOffset += increment;
//         pageValue += increment ~/ 10;
//         winGoHisViewModel.myBetHisApi(context,currentOffset);
//       } else {
//         if (kDebugMode) {
//           print('No data available');
//         }
//       }
//     }
//   }
//
//   void _incrementData(WinGoMyHisViewModel winGoHisViewModel) {
//     _updateData(10,winGoHisViewModel);
//   }
//
//   void _decrementData(WinGoMyHisViewModel winGoHisViewMode) {
//     _updateData(-10,winGoHisViewMode);
//   }
//
//   Widget wingoGameHistoryDetail(
//       String label,
//       String value,
//       Color colorTwo) {
//     return Container(
//       height: height * 0.06,
//       margin: const EdgeInsets.all(4),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           textWidget(
//             text: label,
//             fontSize: width * 0.035,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//           textWidget(
//             text: value,
//             fontSize: 13,
//             fontWeight: FontWeight.w600,
//             color: colorTwo,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/wingo/res/size_const.dart';
import 'package:game/view/game/wingo/view_model/win_go_my_his_view_model.dart';
import 'package:provider/provider.dart';

class WingoMyHis extends StatefulWidget {
  const WingoMyHis({super.key});

  @override
  State<WingoMyHis> createState() => _WingoMyHisState();
}

class _WingoMyHisState extends State<WingoMyHis> {
  int currentOffset = 0;
  int pageValue = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final winGoHisViewModel =
      Provider.of<WinGoMyHisViewModel>(context, listen: false);
      winGoHisViewModel.myBetHisApi(context, currentOffset);
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   final winGoHisViewModel =
  //   Provider.of<WinGoMyHisViewModel>(context);
  //
  //   if (winGoHisViewModel.winGoMyHisModelData!.data!.isNotEmpty) {
  //     return Column(
  //       children: [
  //         ListView.builder(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemCount: winGoHisViewModel.winGoMyHisModelData?.data?.length??0,
  //           itemBuilder: (context, index) {
  //             final betHistoryData =
  //             winGoHisViewModel.winGoMyHisModelData?.data![index];
  //             final color = betHistoryData?.number == 0
  //                 ? [Colors.red, Colors.purple]
  //                 : betHistoryData?.number == 5
  //                 ? [Colors.green, Colors.purple]
  //                 : betHistoryData?.number == 10
  //                 ? [Colors.green, Colors.green]
  //                 : betHistoryData?.number == 20
  //                 ? [Colors.purple, Colors.purple]
  //                 : betHistoryData?.number == 30
  //                 ? [Colors.red, Colors.red]
  //                 : betHistoryData?.number == 40
  //                 ? [Colors.orange, Colors.orange]
  //                 : betHistoryData?.number == 50
  //                 ? [Colors.blue, Colors.blue]
  //                 : (betHistoryData?.number == 2 ||
  //                 betHistoryData?.number == 4 ||
  //                 betHistoryData?.number == 6 ||
  //                 betHistoryData?.number == 8)
  //                 ? [Colors.red, Colors.red]
  //                 : [Colors.green, Colors.green];
  //
  //             return Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Theme(
  //                 data: Theme.of(context)
  //                     .copyWith(dividerColor: Colors.transparent),
  //                 child: ExpansionTile(
  //                   leading: Container(
  //                     alignment: Alignment.center,
  //                     height: height * 0.066,
  //                     width: width * 0.15,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       gradient: LinearGradient(
  //                         colors: color,
  //                         stops: const [0.5, 0.5],
  //                         begin: Alignment.bottomLeft,
  //                         end: Alignment.topRight,
  //                       ),
  //                     ),
  //                     child: textWidget(
  //                       textAlign: TextAlign.center,
  //                       text: betHistoryData?.number == 10
  //                           ? 'G'
  //                           : betHistoryData?.number == 20
  //                           ? 'V'
  //                           : betHistoryData?.number == 30
  //                           ? 'R'
  //                           : betHistoryData?.number == 40
  //                           ? 'B'
  //                           : betHistoryData?.number == 50
  //                           ? 'S'
  //                           : betHistoryData?.number.toString()??"",
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: AppColor.white,
  //                     ),
  //                   ),
  //                   title: textWidget(
  //                     textAlign: TextAlign.center,
  //                     text: betHistoryData?.gamesNo.toString()??"",
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColor.white,
  //                   ),
  //                   subtitle: textWidget(
  //                     textAlign: TextAlign.center,
  //                     text: betHistoryData?.createdAt,
  //                     fontSize: 10,
  //                     color: AppColor.white,
  //                   ),
  //                   trailing: Column(
  //                     children: [
  //                       constantbutton(
  //                         height: height * 0.04,
  //                         width: width * 0.2,
  //                         text: betHistoryData?.status == 0
  //                             ? "Pending"
  //                             : betHistoryData?.status == 1
  //                             ? "Success"
  //                             : "Failed",
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           color: betHistoryData?.status == 0
  //                               ? Colors.orange
  //                               : betHistoryData?.status == 1
  //                               ? Colors.green
  //                               : Colors.red,
  //                           fontSize: 12,
  //                         ),
  //                         gradient: AppColor.transparentGradient,
  //                         border: Border.all(
  //                           color: betHistoryData?.status == 0
  //                               ? Colors.orange
  //                               : betHistoryData?.status == 1
  //                               ? Colors.green
  //                               : Colors.red,
  //                         ),
  //                         onTap: () {},
  //                       ),
  //                       Sizes.spaceHeight5,
  //                       textWidget(
  //                         text: "🪙 ${(betHistoryData?.status == 1 ? betHistoryData?.winAmount : betHistoryData?.amount).toStringAsFixed(2)}",
  //                         fontSize: 12,
  //                         color: betHistoryData?.status == 0
  //                             ? Colors.orange
  //                             : betHistoryData?.status == 1
  //                             ? Colors.green
  //                             : Colors.red,
  //                       ),
  //                     ],
  //                   ),
  //                   children: [
  //                     Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.all(8.0),
  //                             child: textWidget(
  //                               text: "",
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.bold,
  //                               color: AppColor.orange,
  //                             ),
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Order Number",
  //                             betHistoryData?.orderId.toString()??"",
  //                             Colors.orangeAccent,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Period",
  //                             betHistoryData?.gamesNo.toString()??"",
  //                             Colors.orangeAccent,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Purchase Amount",
  //                             "🪙${betHistoryData?.amount}",
  //                             Colors.white,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Amount after TAX",
  //                             "🪙 ${betHistoryData?.tradeAmount}",
  //                             Colors.green,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "TAX",
  //                             "🪙 ${betHistoryData?.commission}",
  //                             Colors.green,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Result",
  //                             betHistoryData?.winNumber.toString()??"",
  //                             Colors.green,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Select",
  //                             betHistoryData?.winNumber.toString()??"",
  //                             Colors.green,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Status",
  //                             betHistoryData?.status == 0
  //                                 ? "Pending"
  //                                 : betHistoryData?.status == 1
  //                                 ? "Success"
  //                                 : "Failed",
  //                             Colors.red,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Win/Loss",
  //                             "🪙 ${betHistoryData?.winAmount.toStringAsFixed(2)}",
  //                             Colors.red,
  //                           ),
  //                           wingoGameHistoryDetail(
  //                             "Order Time",
  //                             betHistoryData?.createdAt.toString()??"",
  //                             Colors.green,
  //                           ),
  //                           SizedBox(height: height * 0.01),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 if (pageValue != 1) {
  //                   _decrementData(winGoHisViewModel);
  //                 }
  //               },
  //               child: Container(
  //                 height: height * 0.06,
  //                 width: width * 0.10,
  //                 decoration: BoxDecoration(
  //                   gradient: pageValue == 1
  //                       ? AppColor.boxGradient : AppColor.appBarGradient,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: const Icon(
  //                   Icons.navigate_before,
  //                   color: AppColor.white,
  //                 ),
  //               ),
  //             ),
  //             Sizes.spaceWidth15,
  //             Row(
  //               children: [
  //                 Text(
  //                   pageValue.toString(),
  //                   style: const TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w600,
  //                     color: AppColor.white,
  //                   ),
  //                 ),
  //                 const Text(
  //                   '/',
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w600,
  //                     color: AppColor.white,
  //                   ),
  //                 ),
  //                 Text(
  //                   (((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1).toString(),
  //                   style: const TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w600,
  //                     color: AppColor.white,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Sizes.spaceWidth15,
  //             GestureDetector(
  //               onTap: () {
  //                 if (pageValue !=
  //                     ((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1) {
  //                   _incrementData(winGoHisViewModel);
  //                 }
  //               },
  //               child: Container(
  //                 height: height * 0.06,
  //                 width: width * 0.10,
  //                 decoration: BoxDecoration(
  //                   gradient: pageValue ==
  //                       ((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1
  //                       ? AppColor.boxGradient : AppColor.appBarGradient,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: const Icon(Icons.navigate_next, color: AppColor.white),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   } else {
  //     return Container(
  //         height: height * 0.2,
  //         width: width,
  //         alignment: Alignment.center,
  //         child: const Text('No data available!',
  //             style: TextStyle(color: Colors.white)));
  //   }
  // }
  Widget build(BuildContext context) {
    final winGoHisViewModel = Provider.of<WinGoMyHisViewModel>(context);

    final winGoMyHisModelData = winGoHisViewModel.winGoMyHisModelData;
    final data = winGoMyHisModelData?.data;

    if (data != null && data.isNotEmpty) {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final betHistoryData = data[index];
              final color = betHistoryData?.number == 0
                  ? [Colors.red, Colors.purple]
                  : betHistoryData?.number == 5
                  ? [Colors.green, Colors.purple]
                  : betHistoryData?.number == 10
                  ? [Colors.green, Colors.green]
                  : betHistoryData?.number == 20
                  ? [Colors.purple, Colors.purple]
                  : betHistoryData?.number == 30
                  ? [Colors.red, Colors.red]
                  : betHistoryData?.number == 40
                  ? [Colors.orange, Colors.orange]
                  : betHistoryData?.number == 50
                  ? [Colors.blue, Colors.blue]
                  : (betHistoryData?.number == 2 ||
                  betHistoryData?.number == 4 ||
                  betHistoryData?.number == 6 ||
                  betHistoryData?.number == 8)
                  ? [Colors.red, Colors.red]
                  : [Colors.green, Colors.green];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: height * 0.066,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: color,
                          stops: const [0.5, 0.5],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: textWidget(
                        textAlign: TextAlign.center,
                        text: betHistoryData?.number == 10
                            ? 'G'
                            : betHistoryData?.number == 20
                            ? 'V'
                            : betHistoryData?.number == 30
                            ? 'R'
                            : betHistoryData?.number == 40
                            ? 'B'
                            : betHistoryData?.number == 50
                            ? 'S'
                            : betHistoryData?.number?.toString() ?? "",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),
                    title: textWidget(
                      textAlign: TextAlign.center,
                      text: betHistoryData?.gamesNo?.toString() ?? "",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                    subtitle: textWidget(
                      textAlign: TextAlign.center,
                      text: betHistoryData?.createdAt ?? "",
                      fontSize: 10,
                      color: AppColor.white,
                    ),
                    trailing: SizedBox(
                      width: width * 0.2, // Set the width for trailing widget
                      child: Column(
                        children: [
                          constantbutton(
                            height: height * 0.04,
                            width: width * 0.2,
                            text: betHistoryData?.status == 0
                                ? "Pending"
                                : betHistoryData?.status == 1
                                ? "Success"
                                : "Failed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: betHistoryData?.status == 0
                                  ? Colors.orange
                                  : betHistoryData?.status == 1
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 12,
                            ),
                            gradient: AppColor.transparentGradient,
                            border: Border.all(
                              color: betHistoryData?.status == 0
                                  ? Colors.orange
                                  : betHistoryData?.status == 1
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            onTap: () {},
                          ),
                          // Sizes.spaceHeight5,
                          textWidget(
                            text: "🪙 ${(betHistoryData?.status == 1 ? betHistoryData?.winAmount : betHistoryData?.amount)?.toStringAsFixed(2)}",
                            fontSize: 12,
                            color: betHistoryData?.status == 0
                                ? Colors.orange
                                : betHistoryData?.status == 1
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      ),
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: textWidget(
                                text: "",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.orange,
                              ),
                            ),
                            wingoGameHistoryDetail(
                              "Order Number",
                              betHistoryData?.orderId?.toString() ?? "",
                              Colors.orangeAccent,
                            ),
                            wingoGameHistoryDetail(
                              "Period",
                              betHistoryData?.gamesNo?.toString() ?? "",
                              Colors.orangeAccent,
                            ),
                            wingoGameHistoryDetail(
                              "Purchase Amount",
                              "🪙${betHistoryData?.amount ?? 0}",
                              Colors.white,
                            ),
                            wingoGameHistoryDetail(
                              "Amount after TAX",
                              "🪙 ${betHistoryData?.tradeAmount ?? 0}",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "TAX",
                              "🪙 ${betHistoryData?.commission ?? 0}",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Result",
                              betHistoryData?.winNumber?.toString() ?? "",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Select",
                              betHistoryData?.winNumber?.toString() ?? "",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Status",
                              betHistoryData?.status == 0
                                  ? "Pending"
                                  : betHistoryData?.status == 1
                                  ? "Success"
                                  : "Failed",
                              Colors.red,
                            ),
                            wingoGameHistoryDetail(
                              "Win/Loss",
                              "🪙 ${(betHistoryData?.winAmount ?? 0).toStringAsFixed(2)}",
                              Colors.red,
                            ),
                            wingoGameHistoryDetail(
                              "Order Time",
                              betHistoryData?.createdAt ?? "",
                              Colors.green,
                            ),
                            SizedBox(height: height * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (pageValue != 1) {
                    _decrementData(winGoHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue == 1
                        ? AppColor.boxGradient
                        : AppColor.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.navigate_before,
                    color: AppColor.white,
                  ),
                ),
              ),
              Sizes.spaceWidth15,
              Row(
                children: [
                  Text(
                    pageValue.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                  Text(
                    (((winGoHisViewModel.winGoMyHisModelData?.totalBets ?? 0) - 1) ~/ 10 + 1).toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              Sizes.spaceWidth15,
              GestureDetector(
                onTap: () {
                  if (pageValue !=
                      ((winGoHisViewModel.winGoMyHisModelData?.totalBets ?? 0) - 1) ~/ 10 + 1) {
                    _incrementData(winGoHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue ==
                        ((winGoHisViewModel.winGoMyHisModelData?.totalBets ?? 0) - 1) ~/ 10 + 1
                        ? AppColor.boxGradient
                        : AppColor.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.navigate_next, color: AppColor.white),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Container(
        height: height * 0.2,
        width: width,
        alignment: Alignment.center,
        child: const Text('No data available!',
            style: TextStyle(color: Colors.white)),
      );
    }
  }


  void _updateData(int increment, WinGoMyHisViewModel winGoHisViewModel) {
    if (winGoHisViewModel.winGoMyHisModelData!.totalBets != null) {
      int countValue = winGoHisViewModel.winGoMyHisModelData!.totalBets!;
      if ((currentOffset + increment >= 0) &&
          (currentOffset + increment < countValue)) {
        currentOffset += increment;
        pageValue += increment ~/ 10;
        winGoHisViewModel.myBetHisApi(context, currentOffset);
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }
  }

  void _incrementData(WinGoMyHisViewModel winGoHisViewModel) {
    _updateData(10, winGoHisViewModel);
  }

  void _decrementData(WinGoMyHisViewModel winGoHisViewMode) {
    _updateData(-10, winGoHisViewMode);
  }

  Widget wingoGameHistoryDetail(
      String label,
      String value,
      Color colorTwo) {
    return Container(
      height: height * 0.06,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(
            text: label,
            fontSize: width * 0.035,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textWidget(
            text: value,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: colorTwo,
          ),
        ],
      ),
    );
  }
}
