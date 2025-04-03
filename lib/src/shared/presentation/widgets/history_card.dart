import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_badge.dart';

class HistoryCard extends StatelessWidget {
  final VoidCallback onPressed;
  const HistoryCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 2, color: DefaultColors.lightGrey3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 14,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/hand_disease.jpg',
                width: 84,
                height: 84,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Superficial basal cell carcinoma carcinoma carcinoma carcinoma',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: FontSize.standardUp,
                      fontWeight: FontWeight.w500,
                      color: DefaultColors.darkBlue,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Terakhir periksa: ',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: FontSize.standard,
                          fontWeight: FontWeight.w400,
                          color: DefaultColors.grey,
                        ),
                      ),
                      Text(
                        '24/04/2025',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: FontSize.standard,
                          fontWeight: FontWeight.w500,
                          color: DefaultColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  CustomBadge(label: 'Tidak Bahaya', style: BadgeStyle.none),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
