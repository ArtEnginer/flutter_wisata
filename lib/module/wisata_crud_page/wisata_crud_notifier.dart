import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/module/wisata_crud_page/wisata_form_page.dart';
import 'package:wisata/repository/wisata_repository.dart';
import 'package:wisata/utils/dialog_custom.dart';
import 'package:image_picker/image_picker.dart';

class WisataCrudNotifier extends ChangeNotifier {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  String? query;
  int? id;
  String? nama;
  String? deskripsi;
  int? htm;
  String? gambar;
  XFile? image;
  late ImagePicker picker = ImagePicker();
  double wisataSize = 100.0;

  late SharedPreferences prefs;
  late String token;

  WisataCrudNotifier(this.context) {
    getData();
  }

  Future<void> navigateForm(BuildContext context,
      {bool edit = false, WisataModel? data}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WisataFormPage(
                edit: edit,
                data: data,
              )),
    );
    if (result != null) {
      getData();
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
    }
  }

  List<WisataModel> listWisata = [];
  Future getData() async {
    isLoading = true;
    notifyListeners();
    listWisata.clear();
    WisataRepository.getWisata(query: query).then((value) {
      listWisata =
          value.map<WisataModel>((json) => WisataModel.fromJson(json)).toList();
    }).onError((error, stackTrace) {
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    image = img;
    notifyListeners();
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => WisataCrudNotifier(context),
          child: Consumer<WisataCrudNotifier>(
            builder: (context, value, child) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: Text('Please choose media to select'),
                content: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                        //if user click this button, user can upload image from gallery
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            Text('From Gallery'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        //if user click this button. user can upload image from camera
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera),
                            Text('From Camera'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future save(saveContext) async {
    var token = await getToken();
    WisataRepository.save(
      token: token,
      id: id,
      nama: nama,
      deskripsi: deskripsi,
      harga: htm,
      image: image,
      gambar: gambar,
    ).then((value) async {
      print("Berhasil : $value");
      Navigator.pop(saveContext, 'Data Baru berhasil ditambahkan');
    }).onError((error, stackTrace) {
      print("Gagal : $error");
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }

  Future hapus(
    saveContext, {
    required int id,
  }) async {
    var token = await getToken();
    WisataRepository.delete(id: id, token: token).then((value) async {
      print("Berhasil : $value");
      Navigator.pop(saveContext, 'Data berhasil dihapus');
    }).onError((error, stackTrace) {
      print("Gagal : $error");
      CustomDialog.messageResponse(context, error.toString());
    }).whenComplete(() => notifyListeners());
  }

  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    return token;
  }
}
