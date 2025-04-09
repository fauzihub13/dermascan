import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class MainAppbar extends StatelessWidget {
  final String name;
  const MainAppbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        color: DefaultColors.appBarBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat datang kembali,',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: FontSize.standard,
                      color: DefaultColors.darkColor,
                    ),
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: FontSize.standardUp,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: DefaultColors.primaryBlue,
              radius: 24.0,
              backgroundImage:
                  const AssetImage('assets/images/profile.jpg')
                      as ImageProvider,
            ),
          ],
        ),
      ),
    );
  }
}
