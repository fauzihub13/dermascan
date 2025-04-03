import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/history_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/title_section.dart';
import 'package:go_router/go_router.dart';

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
            context.pushNamed(RouteName.diagnoseHistoryPage);
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
                  context.pushNamed(RouteName.diagnoseDetailHistoryPage);

                },
              ),
            );
          },
        ),
      ],
    );
  }
}
