import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleSection({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: FontSize.standardUp,
            color: DefaultColors.darkBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: DefaultColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(0, 0),
          ),
          onPressed: onPressed,
          child: const Text(
            'Selengkapnya',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: FontSize.standard,
              color: DefaultColors.darkBlue,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
