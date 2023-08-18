import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/module/welcome_page/welcome_page.dart';
import 'package:wisata/repository/auth_repository.dart';
import 'package:wisata/utils/dialog_custom.dart';

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obsPass = true;

  LoginNotifier(this.context);

  reverseObs() {
    obsPass = !obsPass;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan alamat email yang valid'
        : (value == null || value.isEmpty ? 'Email Tidak boleh kosong' : null);
  }

  AuthModel? auth;
  Future login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthRepository.loginAttempt(email: email!, password: password!)
        .then((value) async {
      print('Berhasil');
      auth = AuthModel.fromJson(value);
      final success = await AuthRepository.login(auth!.token!);
      if (success) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage()),
            (route) => false);
      }
    }).onError((error, stackTrace) {
      print('Gagal');
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }
}
