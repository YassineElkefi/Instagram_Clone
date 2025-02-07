import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider(){
     _loadThemeMode();
  }

  void _loadThemeMode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('themeMode');

    if(theme == 'light'){
      _themeMode = ThemeMode.light;
    }
    else if(theme == 'dark'){
      _themeMode = ThemeMode.dark;
    }
    else{
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void toggleTheme(bool isDark) async{
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', isDark ? 'dark' : 'light');
    notifyListeners();
  }

}