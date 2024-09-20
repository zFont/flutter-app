import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void openLink(String link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      if (mounted) showSnack('Could not launch $url');
    }
  }
}