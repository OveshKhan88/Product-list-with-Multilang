import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLang = 'en';

  String get currentLang => _currentLang;

  void changeLanguage(String lang) {
    _currentLang = lang;
    notifyListeners();
  }

  TextDirection get textDirection =>
      _currentLang == 'ar' ? TextDirection.rtl : TextDirection.ltr;
}
