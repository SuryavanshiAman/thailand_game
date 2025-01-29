import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';

class DepositViewModel with ChangeNotifier{
  final List<Map<String, dynamic>> paymentOptions = [
    {
      'title': 'UPI-QRpay',
      'image': Assets.imagesUip,
      'bgColor': Colors.black,
    },
    {
      'title': 'Wake UP-APP',
      'image': Assets.imagesUpApp,
      'bgColor': Colors.black,
    },
    {
      'title': 'UPI-PayTM',
      'image': Assets.imagesUpiPaytm,
      'bgColor': Colors.amberAccent,
    },
    {
      'title': 'USDT',
      'image': Assets.imagesUsdt,
      'bgColor': Colors.black,
      'badge': '+2%',
    },
  ];
  List<String>transactionType=[
    "All",
    "To be Paid",
    "Complete",
    "Failed",
  ];
  List<String>withdrawType=[
    "All",
    "Processing",
    "Complete",
    "Rejected",
  ];
  final List<Map<String, String>> transactionsHistory = [
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "202501281221572681"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    },
    {
      "balance": "₹200.00",
      "type": "INR",
      "time": "28-Jan-2025, 12:21 PM",
      "orderNumber": "2025012812215774378"
    }
  ];

}
