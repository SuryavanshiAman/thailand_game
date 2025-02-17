import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateLanguageViewModel with ChangeNotifier {
  /// if it is false default language is english and true then hindi
  bool _buttonState = false;
  bool get buttonState => _buttonState;
  String _currentLang = 'en';
  String get currentLang => _currentLang;

// setButtonState(bool value){
//   _buttonState=value;
//   _saveLanguagePreference(value);
//   notifyListeners();
// }

  updateLanguage(Locale language) {
    Locale locale = language;
    Get.updateLocale(locale);
  }

  Future<void> saveLanguagePreference(String value) async {
    print("rrrr:$value ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', value);
  }

  Future<void> getSavedLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentLang =  prefs.getString('lang') ?? 'en';
  }
}
