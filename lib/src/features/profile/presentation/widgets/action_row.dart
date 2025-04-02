import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class ActionRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const ActionRow({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, color: DefaultColors.darkBlue),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: FontSize.standard,
              fontWeight: FontWeight.w400,
              color: DefaultColors.darkBlue,
            ),
          ),
          Spacer(),
          Icon(Icons.navigate_next, color: DefaultColors.darkBlue),
        ],
      ),
    );
  }
}
