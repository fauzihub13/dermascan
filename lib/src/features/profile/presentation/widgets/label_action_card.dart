import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class LabelActionCard extends StatelessWidget {
  final String label;
  const LabelActionCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child:  Text(
        label,
        textAlign: TextAlign.left,
        textWidthBasis: TextWidthBasis.longestLine,
        style: TextStyle(
          color: DefaultColors.darkBlue,
          fontSize: FontSize.standardUp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
