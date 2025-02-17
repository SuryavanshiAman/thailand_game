import 'package:flutter/material.dart';
import 'package:game/res/color-const.dart';
import 'package:game/view/game/Aviator/res/app_button.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../view_model/update_language_view_model.dart';



class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() =>
      _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "en"; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar:GradientAppBar(
        centerTitle: true,
        leading: AppBackBtn(),
        title: Text("Language",style: TextStyle(color: AppColor.white,fontFamily: "SitkaSmall"),),

      ),
      body: Column(
        children: [
          _buildLanguageTile("English", "🇺🇸", "English", Locale('en', 'US')),
          _buildLanguageTile("Hindi", "🇮🇳", "हिंदी", Locale('hi', 'IN')),
          _buildLanguageTile("Thai", "🇹🇭", "ไทย", Locale('th', 'TH')),
        ],
      ),
    );
  }

  Widget _buildLanguageTile(String value, String flag, String language, Locale locale) {
    final lang=Provider.of<UpdateLanguageViewModel>(context);
    return ListTile(
      tileColor: Colors.grey[900], // Dark grey tile background
      leading: Text(flag, style: TextStyle(fontSize: 24)), // Flag icon
      title: Text(language, style: TextStyle(fontSize: 18, color: Colors.white)),
      trailing: Radio<String>(
        value: value,
        groupValue: lang.currentLang,
        onChanged: (String? newValue) {
          setState(() {
            selectedLanguage = newValue!;
          });
          Get.updateLocale(locale);
          lang.saveLanguagePreference(value);
          lang.getSavedLang();
        },
        activeColor: Colors.amber, // Selected color
      ),
    );
  }
}
