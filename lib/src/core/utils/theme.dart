import 'package:flutter/material.dart';

class FontSize {
  static const small = 12.0;
  static const medium = 13.0;
  static const standard = 14.0;
  static const standardUp = 16.0;
  static const standardUp2 = 18.0;
  static const large = 26.0;
}

class PaddingSize {
  static const horizontal = 18.0;
  static const vertical = 18.0;
}

class DefaultColors {
  static const greyText = Color(0xffb3b9c9);
  static const whiteText = Color(0xffFFFFFF);
  static const senderMessage = Color(0xff7a8194);
  static const receiverMessage = Color(0xff3d4354);
  static const sentMessage = Color(0xffF5F5F5);
  static const messageListPage = Color(0xff292f3f);
  static const buttonColor = Color(0xff7a8194);
  static const textInputText = Color(0xff13162f);

  static const primaryColor = Color(0xff0165FC);
  static const textInputBackground = Color(0xff2e3440);
  static const textInputShadow = Color(0x4d000000);
  static const textInputLabel = Color(0xffd8dee9);
  static const textInputIcon = Color(0xffeceff4);
  static const textInputCursor = Color(0xff88c0d0);
  static const darkScaffoldBackground = Color(0xff1b202d);
  static const lightScaffoldBackground = Color(0xffffffff);
  static const lightTextColor = Color(0xff000000);

  static const Color lightInputBackground = Color(0xFFFAFAFC);
  static const Color lightBorderInputBackground = Color(0xFFFAFAFC);
  static const Color darkInputBackground = Color(0xFF1C1C1E);

  // Customnize
  static const Color white = Color(0xffFFFFFF);
  static const Color primaryBlue = Color(0xFF0165FC);
  static const Color darkBlue = Color(0xFF00398F);
  static const Color darkColor = Color(0xFF2B386B);
  static const Color grey = Color(0xFF7D8A95);
  static const Color lightGrey = Color(0xFFB2BCC9);
  static const Color lightGrey2 = Color(0xFFFAFAFC);
  static const Color lightGrey3 = Color(0xFFF7F8F8);
  static const Color lightGrey4 = Color(0xFFEDEDF2);
  static const Color lightBlue = Color(0xFFF4F9FF);
  static const Color navbarDisable = Color(0xFFC4C4C4);

  // SnackBar
  static const Color snackBarGreen = Color(0xff50C474);
  static const Color snackBarYellow = Color(0xffFEC62E);
  static const Color snackBarRed = Color(0xffF4261A);

  // AppBar
  static const Color appBarBackgroundColor = Color(0xffFFFFFF);

  // Diagnose History Badge
  static const Color lightYellowBadge = Color(0xffFFF5D9);
  static const Color darkYellowBadge = Color(0xffCC9603);

  static const Color lightGreenBadge = Color.fromARGB(255, 210, 247, 211);
  static const Color darkGreenBadge = Color(0xff387F39);

  static const Color lightRedBadge = Color.fromARGB(255, 255, 156, 150);
  static const Color darkRedBadge = Color.fromARGB(255, 255, 28, 16);

  static const Color darkBlueBadge = Color(0xFF0165FC);
  static const Color lightBlueBadge = Color(0xffE0EBFF);


}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: DefaultColors.primaryColor,
      scaffoldBackgroundColor: DefaultColors.lightScaffoldBackground,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: FontSize.large,
          color: DefaultColors.primaryBlue,
        ),
        titleMedium: TextStyle(
          fontSize: FontSize.medium,
          color: DefaultColors.lightTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: FontSize.standardUp,
          color: DefaultColors.lightTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: FontSize.standardUp,
          color: DefaultColors.lightTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: FontSize.standard,
          color: DefaultColors.lightTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: FontSize.small,
          color: DefaultColors.greyText,
        ),
      ),
      iconTheme: IconThemeData(color: DefaultColors.lightGrey),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DefaultColors.lightInputBackground,
        labelStyle: TextStyle(color: DefaultColors.lightTextColor),
        hintStyle: TextStyle(
          fontSize: FontSize.standardUp,
          color: DefaultColors.lightGrey,
        ),
        iconColor: DefaultColors.lightGrey,
        suffixIconColor: DefaultColors.lightGrey,
        prefixIconColor: DefaultColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: DefaultColors.lightBorderInputBackground,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: DefaultColors.lightBorderInputBackground,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: DefaultColors.primaryColor, width: 2),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: DefaultColors.primaryColor,
        selectionColor: DefaultColors.primaryColor.withValues(alpha: 0.2),
        selectionHandleColor: DefaultColors.primaryColor,
      ),
      buttonTheme: ButtonThemeData(buttonColor: DefaultColors.primaryColor),
    );
  }
}
