import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_row.dart';

class ActionCard extends StatelessWidget {
  final List<ActionRow> list;
  const ActionCard({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: DefaultColors.lightBlue,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        children: list,
      ),
    );
  }
}
