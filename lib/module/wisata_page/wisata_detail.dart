import 'package:flutter/material.dart';
import 'package:wisata/models/index.dart';
import 'package:wisata/module/wisata_page/wisata_widget.dart';
import 'package:wisata/network/base_api.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/context_extensions.dart';
import 'package:wisata/utils/widgets/custom_network_image.dart';

class WisataDetail extends StatelessWidget {
  final WisataModel data;

  const WisataDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Stack(
            children: [
              Container(
                width: context.screenWidth,
                height: 250,
                child: CustomNetworkImage(
                  imageUrl: BaseApi().getFileUrl("image") + data.gambar,
                  fit: BoxFit.cover,
                  placeholder: const WisataPosterPlaceholder(iconSize: 40),
                  errorWidget: const WisataPosterPlaceholder(iconSize: 40),
                ),
              ),
              Positioned(
                top: 0,
                width: context.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkResponse(
                        radius: 25,
                        child: Icon(Icons.close, size: 26),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                          child: Text(
                        data.nama,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: context.headline5.copyWith(
                          shadows: [
                            Shadow(
                              offset: Offset(0, 0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 225,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    width: context.screenWidth,
                    height: context.screenHeight - 225,
                    padding: EdgeInsets.all(25),
                    child: ListView(
                      children: [
                        Text(
                          data.deskripsi,
                          style: context.bodyText2,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                top: 210,
                left: 0,
                right: 0,
                child: Chip(
                  backgroundColor: Constants.primaryColor,
                  label: Text(data.htm.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
