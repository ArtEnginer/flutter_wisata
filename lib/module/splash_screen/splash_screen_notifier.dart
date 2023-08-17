import 'package:flutter/material.dart';
import 'package:wisata/module/home_page/home_page.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;

  SplashScreenNotifier(this.context) {
    pertama();
  }
  pertama() {
    Future.delayed(const Duration(seconds: 6)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    });
  }
}
