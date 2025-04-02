import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

enum BadgeStyle { none, low, medium, high }

class CustomBadge extends StatelessWidget {
  final String label;
  final BadgeStyle style;

  const CustomBadge({super.key, required this.label, required this.style});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (style) {
      case BadgeStyle.low:
        backgroundColor = DefaultColors.lightGreenBadge;
        textColor = DefaultColors.darkGreenBadge;
        break;
      case BadgeStyle.medium:
        backgroundColor = DefaultColors.lightYellowBadge;
        textColor = DefaultColors.darkYellowBadge;
        break;
      case BadgeStyle.high:
        backgroundColor = DefaultColors.lightRedBadge;
        textColor = DefaultColors.darkRedBadge;
        break;
      case BadgeStyle.none:
        backgroundColor = DefaultColors.lightBlueBadge;
        textColor = DefaultColors.darkBlueBadge;
        break;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Text(
        label,
        style: TextStyle(
          fontSize: FontSize.small,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
