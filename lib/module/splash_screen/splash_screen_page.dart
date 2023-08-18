import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/splash_screen/splash_screen_notifier.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenNotifier(context),
      child: Consumer<SplashScreenNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: const Color.fromARGB(255, 37, 37, 37),
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 300,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            height: 70,
                            width: 70,
                            child: Column(
                              children: [
                                CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
