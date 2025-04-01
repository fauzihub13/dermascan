import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class CustomSnackbar {
  static void show(BuildContext context,
      {required String message,
      double? marginVertical = 10,
      double? marginHorizontal = 18,
      required String status,
      int? duration = 3}) {
        Color backgroundColor;
    if (status == 'success') {
      backgroundColor = DefaultColors.snackBarGreen; 
    } else if (status == 'fail') {
      backgroundColor = DefaultColors.snackBarRed; 
    } else if (status == 'warning') {
      backgroundColor = DefaultColors.snackBarYellow;
    } else {
      backgroundColor = DefaultColors.primaryBlue;

    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
            horizontal: marginHorizontal!, vertical: marginVertical!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: duration!),
      ),
    );
  }
}
