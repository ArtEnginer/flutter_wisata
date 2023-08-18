import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/wisata_crud_page/wisata_crud_notifier.dart';
import 'package:wisata/module/wisata_crud_page/wisata_form_page.dart';
import 'package:wisata/module/wisata_page/wisata_widget.dart';
import 'package:wisata/network/base_api.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/context_extensions.dart';
import 'package:wisata/utils/widgets/custom_network_image.dart';
import 'package:wisata/utils/widgets/custom_textfield.dart';

class WisataCrudPage extends StatelessWidget {
  const WisataCrudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WisataCrudNotifier(context),
      child: Consumer<WisataCrudNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: context.screenWidth,
                    height: 65,
                    child: Form(
                      key: value.formKey,
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
                            InkResponse(
                              radius: 25,
                              child: Icon(Icons.plus_one, size: 26),
                              onTap: () {
                                value.navigateForm(context, edit: false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //Bookings history
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 550),
                        switchOutCurve: Curves.easeInBack,
                        child: value.isLoading
                            ? WisataSkeletonLoader()
                            : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.listWisata.length,
                                separatorBuilder: (_, i) =>
                                    const SizedBox(height: 20),
                                itemBuilder: (_, i) {
                                  final booking = value.listWisata[i];
                                  return SizedBox(
                                    height: 140,
                                    child: GestureDetector(
                                      onTap: () => value.navigateForm(context,
                                          edit: true,
                                          data: value.listWisata[i]),
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          //Booking overview
                                          WisataSummaryRow(
                                            edit: true,
                                            nama: value.listWisata[i].nama,
                                            deskripsi:
                                                value.listWisata[i].deskripsi,
                                          ),

                                          //Movie Image
                                          Positioned(
                                            bottom: 13,
                                            left: 13,
                                            child: CustomNetworkImage(
                                              imageUrl: BaseApi()
                                                      .getFileUrl("image") +
                                                  booking.gambar,
                                              fit: BoxFit.cover,
                                              width: value.wisataSize,
                                              height: value.wisataSize + 25,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              placeholder:
                                                  const WisataPosterPlaceholder(
                                                      iconSize: 40),
                                              errorWidget:
                                                  const WisataPosterPlaceholder(
                                                      iconSize: 40),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
