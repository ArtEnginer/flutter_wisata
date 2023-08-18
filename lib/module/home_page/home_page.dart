import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/home_page/home_notifier.dart';
import 'package:wisata/module/login_page/login_page.dart';
import 'package:wisata/module/register_page/register_page.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: const EdgeInsets.fromLTRB(
                  20, 125, 20, Constants.bottomInsets),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Heading text
                  Text(
                    'WisataApp',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Constants.primaryColor,
                        ),
                  ),

                  const SizedBox(height: 35),

                  //Welcome msg
                  Text(
                    'Selamat Datang\ndi WisataApp',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  const SizedBox(height: 40),

                  //Experience msg
                  Text(
                    'Jelajahi wisatamu\ndari ponsel',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Constants.textGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                        ),
                  ),

                  const Spacer(),

                  //Login row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Login button
                      Expanded(
                        child: CustomTextButton.gradient(
                          width: double.infinity,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          gradient: Constants.buttonGradientRed,
                          child: const Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 17),

                  //Register button
                  CustomTextButton.outlined(
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    border: Border.all(color: Constants.primaryColor, width: 4),
                    child: const Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 15,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
