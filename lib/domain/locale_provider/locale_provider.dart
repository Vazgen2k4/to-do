import 'package:flutter/cupertino.dart';

class LocaleProvider  extends ChangeNotifier{
  Locale _locale = Locale('ru');
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}