import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canBack;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.canBack,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: []),
      child: AppBar(
        toolbarHeight: 60,
        backgroundColor: backgroundColor ?? DefaultColors.white,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              canBack
                  ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: DefaultColors.lightGrey4,
                        width: 0.7,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: DefaultColors.darkBlue,
                          size: 16,
                        ),
                        onPressed: () {
                          if (onTap != null) {
                            onTap!();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  )
                  : const SizedBox(width: 40),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? DefaultColors.darkBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.standardUp2,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
