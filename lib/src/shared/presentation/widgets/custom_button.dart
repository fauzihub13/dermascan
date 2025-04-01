import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

enum ButtonStyle { filled, outlined }

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  const CustomButton.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = DefaultColors.primaryBlue,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 32.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height,i
      width: width,
      child:
          style == ButtonStyle.filled
              ? ElevatedButton(
                onPressed: disabled ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    if (icon != null) const SizedBox(width: 10.0),
                    Text(
                      label,
                      style: TextStyle(
                        color: disabled ? DefaultColors.white : textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
              : OutlinedButton(onPressed: onPressed, child: Row()),
    );
  }
}
