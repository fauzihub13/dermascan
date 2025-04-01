import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class FormLabel extends StatelessWidget {
  final String label;
  const FormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: FontSize.standardUp,
        fontWeight: FontWeight.w400,
        color: DefaultColors.darkColor,
      ),
    );
  }
}
