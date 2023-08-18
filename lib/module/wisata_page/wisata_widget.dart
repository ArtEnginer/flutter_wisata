import 'package:flutter/material.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/shimmer_loader.dart';

class WisataSkeletonLoader extends StatelessWidget {
  const WisataSkeletonLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: ListView.separated(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (ctx, i) => const SizedBox(height: 20),
        itemBuilder: (ctx, i) => const _WisataSkeleton(),
      ),
    );
  }
}

class _WisataSkeleton extends StatelessWidget {
  const _WisataSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Booking overview
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                //Booking details
                _WisataDetailsSkeleton(),

                //No of seats
                SizedBox(
                  height: double.infinity,
                  width: 45,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Constants.darkSkeletonColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Movie Image
          const Positioned(
            bottom: 13,
            left: 13,
            child: SizedBox(
              height: 125,
              width: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.darkSkeletonColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Icon(
                    Icons.tour,
                    color: Constants.lightSkeletonColor,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WisataDetailsSkeleton extends StatelessWidget {
  const _WisataDetailsSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Constants.lightSkeletonColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(125, 10, 10, 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //Movie data
            SizedBox(
              height: 25,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.darkSkeletonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //Show details
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Constants.darkSkeletonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WisataPosterPlaceholder extends StatelessWidget {
  final double? height;
  final double borderRadius, iconSize;
  final AlignmentGeometry childXAlign;
  final EdgeInsetsGeometry? margin;
  final EdgeInsets? padding;

  const WisataPosterPlaceholder({
    this.height,
    this.padding,
    this.margin,
    Alignment? childXAlign,
    MainAxisAlignment? childYAlign,
    double? borderRadius,
    double? iconSize,
    double? fontSize,
  })  : childXAlign = childXAlign ?? Alignment.center,
        borderRadius = borderRadius ?? 20,
        iconSize = iconSize ?? 65;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Constants.scaffoldColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Align(
        alignment: childXAlign,
        child: Icon(
          Icons.tour,
          color: Constants.primaryColor,
          size: iconSize,
        ),
      ),
    );
  }
}

class WisataSummaryRow extends StatelessWidget {
  final String nama;
  final String deskripsi;

  const WisataSummaryRow({
    Key? key,
    this.nama = "Judul",
    this.deskripsi = "Deskripsi",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Ticket total and movie name
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Constants.scaffoldGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(125, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Movie data
                  Text(
                    nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Constants.textWhite80Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    deskripsi,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Constants.textWhite80Color,
                    ),
                  )
                ],
              ),
            ),
          ),

          //No of seats
          SizedBox(
            height: double.infinity,
            width: 45,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: Constants.buttonGradientRed,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Ticket icon
                  const Icon(
                    Icons.remove_red_eye,
                    color: Constants.textWhite80Color,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
