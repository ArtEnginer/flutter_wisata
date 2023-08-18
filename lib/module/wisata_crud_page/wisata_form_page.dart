import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/module/wisata_crud_page/wisata_crud_notifier.dart';
import 'package:wisata/module/wisata_page/wisata_widget.dart';
import 'package:wisata/network/base_api.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/context_extensions.dart';
import 'package:wisata/utils/widgets/custom_network_image.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';
import 'package:wisata/utils/widgets/custom_textfield.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class WisataFormPage extends StatelessWidget {
  final bool edit;
  final WisataModel? data;
  const WisataFormPage({
    Key? key,
    this.edit = false,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WisataCrudNotifier(context),
      child: Consumer<WisataCrudNotifier>(
        builder: (context, value, child) {
          value.id = data?.id;
          value.nama = data?.nama;
          value.deskripsi = data?.deskripsi;
          value.htm = data?.htm;
          value.gambar = data?.gambar;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: context.screenWidth,
                    height: 65,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            radius: 25,
                            child: Icon(Icons.arrow_back_sharp, size: 26),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            edit ? "Edit Wisata" : "Tambah Wisata",
                            style: context.headline5,
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //Bookings history
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        key: value.formKey,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Input Gambar",
                                  style:
                                      context.headline5.copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                value.image != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: kIsWeb
                                              ? Image.network(
                                                  value.image!.path,
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                )
                                              : Image.file(
                                                  File(value.image!.path),
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                ),
                                        ),
                                      )
                                    : value.gambar != null
                                        ? Image.network(
                                            BaseApi().getFileUrl("image") +
                                                value.gambar!)
                                        : FaIcon(FontAwesomeIcons.image),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    value.myAlert();
                                  },
                                  child: Text('Upload'),
                                ),
                              ],
                            ),
                            //Email
                            CustomTextField(
                              value: value.nama,
                              floatingText: 'Nama Wisata',
                              hintText: 'Masukkan nama wisata',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Wisata Tidak boleh kosong';
                                }
                                return null;
                              },
                              onSaved: (newValue) => value.nama = newValue,
                            ),
                            CustomTextField(
                              value: value.deskripsi,
                              height: 200,
                              floatingText: 'Deskripsi Wisata',
                              hintText: 'Masukkan Deskripsi wisata',
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Deskripsi Tidak boleh kosong';
                                }
                                return null;
                              },
                              onSaved: (newValue) => value.deskripsi = newValue,
                            ),
                            CustomTextField(
                              value: value.htm?.toString(),
                              floatingText: 'Harga Tiket',
                              hintText: 'Masukkan harga tiket masuk wisata',
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.none,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Harga Tiket Tidak boleh kosong';
                                }
                                return null;
                              },
                              onSaved: (String? field) =>
                                  value.htm = int.parse(field!),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20, 40, 20, Constants.bottomInsets),
                              child: Column(
                                children: [
                                  edit
                                      ? CustomTextButton.outlined(
                                          border: Border.all(
                                              color: Constants.primaryColor,
                                              width: 4),
                                          child: const Center(
                                            child: Text(
                                              'HAPUS',
                                              style: TextStyle(
                                                color: Constants.primaryColor,
                                                fontSize: 15,
                                                letterSpacing: 0.7,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.question,
                                              animType: AnimType.rightSlide,
                                              title: 'Hapus Data',
                                              desc:
                                                  'Apakah anda yakin ingin menghapus data ini?',
                                              width: 500,
                                              btnCancelOnPress: () {},
                                              btnOkOnPress: () => value.hapus(
                                                  context,
                                                  id: value.id!),
                                            ).show();
                                          })
                                      : SizedBox(),
                                  SizedBox(height: 15),
                                  CustomTextButton.gradient(
                                    width: double.infinity,
                                    onPressed: () {
                                      value.formKey.currentState!.save();
                                      if (value.formKey.currentState!
                                          .validate()) {
                                        value.save(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Processing Data......')));
                                      }
                                    },
                                    gradient: Constants.buttonGradientOrange,
                                    child: const Center(
                                      child: Text(
                                        'SIMPAN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          letterSpacing: 0.7,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        //Login button
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
