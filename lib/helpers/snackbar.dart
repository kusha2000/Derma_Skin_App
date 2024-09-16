import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class AppHelpers {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.kFabColor,
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
