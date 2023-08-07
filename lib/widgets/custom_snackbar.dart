
import 'package:flavor_fleet_admin_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
  String message, {
  bool isError = true,
  String title = 'Error,',
  Color color = const Color.fromARGB(255, 116, 185, 181),
  SnackPosition position = SnackPosition.BOTTOM,
}) {
  Get.snackbar(
    duration: const Duration(milliseconds: 1250),
    margin: const EdgeInsets.only(
      bottom: 20,
      right: 10,
      left: 10,
    ),
    title,
    message,
    titleText: BigText(
      text: title,
      color: Colors.white,
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    ),
    colorText: Colors.white,
    snackPosition: position,
    backgroundColor: color.withOpacity(0.5),
  );
}
