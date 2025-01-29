class WinGoApiUrl{
  // base url
  static const String baseUrl = 'https://root.jupitergames.app/api/';
  static const String profile = 'https://root.jupitergames.app/api/profile/';
  //wingo api url
  static const String wingoBet = "${baseUrl}bets";
  static const String winGoMyBetHis = "${baseUrl}bet_history";
  static const String wingoWinAmount = "${baseUrl}win_amount?userid=";
  static const String winGoGameHis = "${baseUrl}results?limit=10&game_id=";
  static const String winGoLastResult = "${baseUrl}last_five_result?limit=5&game_id=";
  //wingo socket url
  // static const String wingoSocketUrl = "https://foundercodetech.com";
  static const String wingoSocketUrl = "https://aviatorudaan.com";
  static const String wingoEventOne = "jupitar1";
  static const String wingoEventThree = "jupitar3";
  static const String wingoEventFive = "jupitar5";
  static const String wingoEventTen = "jupitar30";
}