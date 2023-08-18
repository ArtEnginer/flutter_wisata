import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/wisata_page/wisata_notifier.dart';
import 'package:wisata/module/wisata_page/wisata_widget.dart';
import 'package:wisata/network/base_api.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/context_extensions.dart';
import 'package:wisata/utils/widgets/custom_network_image.dart';
import 'package:wisata/utils/widgets/custom_textfield.dart';

class WisataPage extends StatelessWidget {
  const WisataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WisataNotifier(context),
      child: Consumer<WisataNotifier>(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 15),
                          InkResponse(
                            radius: 25,
                            child: Icon(Icons.arrow_back_sharp, size: 26),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),

                          const SizedBox(width: 20),

                          //Page Title
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                // fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Cari Wisata .....",
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              validator: (value) => null,
                              onSaved: (newValue) => value.query = newValue,
                            ),
                          ),

                          const SizedBox(width: 20),
                          InkResponse(
                            radius: 25,
                            child: Icon(Icons.search, size: 26),
                            onTap: () {
                              // AppRouter.pop();
                            },
                          ),

                          const SizedBox(width: 15),
                        ],
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
                                      onTap: () {},
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          //Booking overview
                                          WisataSummaryRow(
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
