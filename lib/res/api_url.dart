

class ApiUrl{
  static const String baseUrl = 'https://thailand.mobileappdemo.net/api/';
  static const String registerApi = '${baseUrl}register';
  static const String loginApi = '${baseUrl}login';
  static const String profileApi = '${baseUrl}profile/';
  static const String updateProfileApi = '${baseUrl}updateprofile';
  static const String avtarImageApi = '${baseUrl}allimage';
  static const String editPasswordApi = '${baseUrl}editpassword';
  static const String notificationApi = '${baseUrl}notification';
  static const String aboutUsApi = '${baseUrl}aboutus/';
  static const String giftCardsApi = '${baseUrl}giftcards';
  static const String giftHistoryApi = '${baseUrl}Gifthistory/';
  static const String feedbackApi = '${baseUrl}feedback';
  static const String mainWalletTransfer = '${baseUrl}wallettransfer/';
  static const String depositApi = '${baseUrl}wallettransfer/';
  static const String depositHistoryApi = '${baseUrl}wallettransfer/';
  static const String withdrawApi = '${baseUrl}withdrawal';
  static const String withdrawHistoryApi = '${baseUrl}withdrawalhistory';
  static const String bankNameApi = '${baseUrl}bankname';
  static const String addBankApi = '${baseUrl}addbank';
  static const String viewBankApi = '${baseUrl}viewbank/';
  static const String paymentLimitApi = '${baseUrl}getPaymentLimits';
  static const String transactionType = '${baseUrl}TransactionType';
  static const String transactionApi = '${baseUrl}Transaction_wallet_histories';

  /// wingo game api
  static const String wingoBet = "${baseUrl}bets";
  static const String winGoMyBetHis = "${baseUrl}bet_history";
  static const String wingoWinAmount = "${baseUrl}win_amount?userid=";
  static const String winGoGameHis = "${baseUrl}results?limit=10&game_id=";
  static const String winGoLastResult = "${baseUrl}last_five_result?limit=5&game_id=";
  //wingo socket url
  static const String wingoSocketUrl = "https://aviatorudaan.com";
  static const String wingoEventOne = "jupitar1";
  static const String wingoEventThree = "jupitar3";
  static const String wingoEventFive = "jupitar5";
  static const String wingoEventTen = "jupitar30";
  /// andarbahar game api
  static const String dragonBet = '${baseUrl}dragon_bet';
}