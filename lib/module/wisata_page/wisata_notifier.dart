import 'package:flutter/material.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/repository/wisata_repository.dart';
import 'package:wisata/utils/dialog_custom.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WisataNotifier extends ChangeNotifier {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  String? query;
  bool isLoading = true;
  double wisataSize = 100.0;

  WisataNotifier(this.context) {
    getData();
  }

  List<WisataModel> listWisata = [];
  Future getData() async {
    isLoading = true;
    listWisata.clear();
    WisataRepository.getWisataAll().then((value) {
      listWisata =
          value.map<WisataModel>((json) => WisataModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
