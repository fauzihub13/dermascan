import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/core/utils/variables.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_badge.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final VoidCallback onPressed;
  final DiagnoseHistoryEntity diagnoseHistoryEntity;

  HistoryCard({
    super.key,
    required this.onPressed,
    required this.diagnoseHistoryEntity,
  });

  final List<Map<String, dynamic>> listPriority = [
    {
      'priority': 'tidak_bahaya',
      'label': 'Tidak Bahaya',
      'style': BadgeStyle.none,
    },
    {'priority': 'rendah', 'label': 'Rendah', 'style': BadgeStyle.low},
    {'priority': 'sedang', 'label': 'Sedang', 'style': BadgeStyle.medium},
    {'priority': 'bahaya', 'label': 'Bahaya', 'style': BadgeStyle.high},
  ];

  Map<String, dynamic> _getStatusData(String status) {
    final statusData = listPriority.firstWhere(
      (item) => item['priority'] == status,
      orElse: () => {'label': status, 'style': BadgeStyle.none},
    );
    return statusData;
  }

  @override
  Widget build(BuildContext context) {
    final statusData = _getStatusData(diagnoseHistoryEntity.priority);

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
              child: Image.network(
                Variables.baseUrl + diagnoseHistoryEntity.imagePath,
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
                    diagnoseHistoryEntity.label,
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
                        DateFormat(
                          'dd/M/yy',
                        ).format(diagnoseHistoryEntity.createdAt),
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: FontSize.standard,
                          fontWeight: FontWeight.w500,
                          color: DefaultColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  CustomBadge(
                    label: statusData['label'],
                    style: statusData['style'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
