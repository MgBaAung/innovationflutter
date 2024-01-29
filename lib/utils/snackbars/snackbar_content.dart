import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/theme/app_color.dart';

class SnackbarContent {
  static Duration snackBarDuration = const Duration(seconds: 2);
  static Duration animationDuration = const Duration(milliseconds: 500);

  static void errorSnackBar(String error) {
    Get.snackbar(
      "Invalid", // title
      error, // message
      duration: snackBarDuration,
      animationDuration: animationDuration,
      backgroundColor: Colors.white, // background color of the snackbar
      colorText: AppColor.redColor, // text color of the snackbar
      snackPosition: SnackPosition.BOTTOM, // position of the snackbar
      margin:
          EdgeInsets.symmetric(vertical: DM.height40, horizontal: DM.width30),
    );
  }

  static void downloadErrorSnackBar(String error) {
    Get.snackbar(
      "Download Error", // title
      error, // message
      duration: snackBarDuration,
      animationDuration: animationDuration,
      backgroundColor: Colors.white, // background color of the snackbar
      colorText: AppColor.redColor, // text color of the snackbar
      snackPosition: SnackPosition.BOTTOM, // position of the snackbar
      margin: EdgeInsets.only(
        left: DM.height40,
        right: DM.height40 + 10,
      ),
    );
  }

  static void successSnackBar(String success) {
    Get.snackbar(
      "Success", // title
      success, // message
      duration: snackBarDuration,
      animationDuration: animationDuration,
      backgroundColor: Colors.white, // background color of the snackbar
      colorText: Colors.green, // text color of the snackbar
      snackPosition: SnackPosition.BOTTOM, // position of the snackbar
      margin:
          EdgeInsets.symmetric(vertical: DM.height40, horizontal: DM.width30),
    );
  }

  static void transparentSnackBar(String message) {
    Get.snackbar(
      "Information", // title
      message, // message
      duration: snackBarDuration,
      animationDuration: animationDuration,
      backgroundColor: Colors.white, // background color of the snackbar
      colorText: Colors.indigo, // text color of the snackbar
      snackPosition: SnackPosition.BOTTOM, // position of the snackbar
      margin:
          EdgeInsets.symmetric(vertical: DM.height40, horizontal: DM.width30),
    );
  }
}
