import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class ActionRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  const ActionRow({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = DefaultColors.darkBlue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: FontSize.standard,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
          Spacer(),
          Icon(Icons.navigate_next, color: color),
        ],
      ),
    );
  }
}
