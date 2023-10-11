import 'package:flutter/material.dart';

class LoginInputValidation {
  static bool checkInput(String username, String password){
    if (username.isEmpty && password.isEmpty) {
      return false;
    } else if (username.isNotEmpty && password.isEmpty){
      return false;
    } else if (username.isEmpty && password.isNotEmpty){
      return false;
    } else {
      return true;
    }
  }
}