import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata/module/home_page/home_page.dart';
import 'package:wisata/module/welcome_page/welcome_page.dart';
import 'package:wisata/module/wisata_page/wisata_page.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;
  String? loggedIn;
  late SharedPreferences prefs;

  SplashScreenNotifier(this.context) {
    pertama();
  }

  cekLogin() async {
    prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getString('token');
    print(loggedIn);
    print(loggedIn != null);
    if (loggedIn != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
          (route) => false);
    }
    notifyListeners();
  }

  pertama() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      cekLogin();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }
}
