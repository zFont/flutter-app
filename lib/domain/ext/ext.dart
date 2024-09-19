import 'package:flutter/material.dart';

extension ContextX on BuildContext{
  void showSnack(String msg){
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  bool _isDarkMode(){
    var brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }

  bool get isDarkMode => _isDarkMode();
}