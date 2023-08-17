import 'package:flutter/material.dart';
import 'package:wisata/utils/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String? name;
  final Function onTap;
  const ButtonPrimary({Key? key, this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: colorPrimary),
            color: colorPrimary),
        child: Text(
          "$name",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ButtonSecondary extends StatelessWidget {
  final String? name;
  final Function onTap;
  const ButtonSecondary({Key? key, this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: colorPrimary,
          ),
        ),
        child: Text(
          "$name",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: colorPrimary,
          ),
        ),
      ),
    );
  }
}
