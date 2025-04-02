import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class HistoryStatisticCard extends StatelessWidget {
  final int? count;
  final String? lastCheck;
  final Function() onPressed;

  const HistoryStatisticCard({
    super.key,
    this.count = 0,
    this.lastCheck = '-',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: DefaultColors.lightBlue,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  'Riwayat Diagnosa',
                  style: TextStyle(
                    fontSize: FontSize.standardUp,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.darkBlue,
                  ),
                ),
                Text(
                  count!.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.darkBlue,
                  ),
                ),
                Text(
                  lastCheck!.isNotEmpty ? 'Terakhir ${lastCheck!}' : '-',
                  style: TextStyle(
                    fontSize: FontSize.standard,
                    fontWeight: FontWeight.w400,
                    color: DefaultColors.grey,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_outward, size: 44),
          ],
        ),
      ),
    );
  }
}
