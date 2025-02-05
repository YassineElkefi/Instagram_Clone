import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login(String email, String password){

    if(email == 'insta@clone.com' && password == 'password'){
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout(){
    _isLoggedIn = false;
    notifyListeners();
  }
}