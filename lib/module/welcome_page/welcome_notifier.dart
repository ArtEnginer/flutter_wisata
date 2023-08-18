import 'package:flutter/material.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/repository/auth_repository.dart';

class WelcomeNotifier extends ChangeNotifier {
  final BuildContext context;
  UserModel? user;

  WelcomeNotifier(this.context) {
    getData();
  }

  getData() async {
    user = await AuthRepository.getUser();
    print(user);
    notifyListeners();
  }
}
