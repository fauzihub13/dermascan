import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_row.dart';

class ActionCard extends StatelessWidget {
  final List<ActionRow> list;
  final Color? color;

  const ActionCard({
    super.key,
    required this.list,
    this.color = DefaultColors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
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
