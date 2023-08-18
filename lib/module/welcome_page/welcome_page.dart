import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/login_page/login_page.dart';
import 'package:wisata/module/register_page/register_page.dart';
import 'package:wisata/module/welcome_page/welcome_notifier.dart';
import 'package:wisata/module/welcome_page/welcome_widget.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeNotifier(context),
      child: Consumer<WelcomeNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  //Logout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Log out icon
                      RotatedBox(
                        quarterTurns: 2,
                        child: InkResponse(
                          radius: 26,
                          child: const Icon(
                            Icons.logout,
                            color: Constants.primaryColor,
                            size: 30,
                          ),
                          onTap: () {
                            // ref.read(authProvider.notifier).logout();
                            // AppRouter.popUntilRoot();
                          },
                        ),
                      ),

                      //Edit profile icon
                      // InkResponse(
                      //   radius: 26,
                      //   child: const Icon(
                      //     Icons.manage_accounts_sharp,
                      //     color: Constants.primaryColor,
                      //     size: 30,
                      //   ),
                      //   onTap: () {
                      //     AppRouter.pushNamed(Routes.ChangePasswordScreenRoute);
                      //   },
                      // )
                    ],
                  ),

                  const SizedBox(height: 20),

                  //Welcome
                  Text(
                    'Selamat Datang',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Constants.primaryColor,
                          fontSize: 45,
                        ),
                  ),

                  const SizedBox(height: 50),

                  //User Details
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: UserProfileDetails(
                        value: value,
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  //Booking History Button
                  // const ViewTiketButton(),

                  // const SizedBox(height: 20),

                  //Browse Movies Button
                  const BrowseWisataButton(),

                  const SizedBox(height: Constants.bottomInsetsLow + 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
