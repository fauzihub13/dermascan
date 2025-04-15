import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_result_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';

class DetailDiagnoseDialog extends StatelessWidget {
  final ClassificationResultEntity? classificationResultEntity;
  final DiagnoseHistoryEntity? diagnoseHistoryEntity;
  const DetailDiagnoseDialog({
    super.key,
    this.classificationResultEntity,
    this.diagnoseHistoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> resultsData = [];
    if (diagnoseHistoryEntity != null) {
      // Extract the relevant Map data from DiagnoseHistoryEntity list
      resultsData =
          diagnoseHistoryEntity!.classifyImageResults
              .map(
                (entity) => {
                  'label': entity.label,
                  'confidence': entity.confidence,
                },
              )
              .toList();
    } else if (classificationResultEntity != null) {
      resultsData = classificationResultEntity!.results;
    }
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Wrap(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                  'TOP 3 AKURASI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.standardUp2,
                    fontWeight: FontWeight.w800,
                    color: DefaultColors.darkBlue,
                  ),
                ),
              ),
            ),
            ListView.separated(
              itemCount: resultsData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 6);
              },
              itemBuilder: (context, index) {
                final result = resultsData[index];

                return Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}.',
                      style: TextStyle(
                        fontSize: FontSize.standardUp,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.darkBlue,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${result['label']} (${result['confidence'].toStringAsFixed(2)}%)',
                        style: TextStyle(
                          fontSize: FontSize.standardUp,
                          fontWeight: FontWeight.w600,
                          color: DefaultColors.darkBlue,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: CustomButton.filled(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: 'Tutup',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
