import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/detail_history_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/history_page.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/history_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/title_section.dart';

class HistoryList extends StatelessWidget {
  final int count;
  const HistoryList({super.key, this.count = 4});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSection(
          title: 'Riwayat Diagnosa',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HistoryPage();
                },
              ),
            );
          },
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: HistoryCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetailHistoryPage();
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
