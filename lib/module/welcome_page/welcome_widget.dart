import 'package:flutter/material.dart';
import 'package:wisata/module/home_page/home_page.dart';
import 'package:wisata/module/welcome_page/welcome_notifier.dart';
import 'package:wisata/module/welcome_page/welcome_page.dart';
import 'package:wisata/module/wisata_page/wisata_page.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';

class UserProfileDetails extends StatelessWidget {
  final WelcomeNotifier value;
  const UserProfileDetails({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Full Name Label
        Text(
          'Nama Lengkap',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Constants.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),

        //Full Name
        Text(
          value.user?.fullname ?? "Nama",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Constants.textWhite80Color,
                fontSize: 18,
              ),
        ),

        //Email Label
        Text(
          'Email',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Constants.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),

        //Email Data
        Text(
          value.user?.email ?? "Email",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Constants.textWhite80Color,
                fontSize: 18,
              ),
        ),

        const Spacer(),
      ],
    );
  }
}

class ViewTiketButton extends StatelessWidget {
  const ViewTiketButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextButton.outlined(
      width: double.infinity,
      onPressed: () => {},
      border: Border.all(color: Constants.primaryColor, width: 4),
      child: const Center(
        child: Text(
          'LIHAT TIKET',
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 15,
            letterSpacing: 0.7,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class BrowseWisataButton extends StatelessWidget {
  const BrowseWisataButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextButton.gradient(
      width: double.infinity,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WisataPage()));
      },
      gradient: Constants.buttonGradientOrange,
      child: const Center(
        child: Text(
          'CARI WISATA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 0.7,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
