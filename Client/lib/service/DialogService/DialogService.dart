import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService {
  static showErrorDialog({String title = "Error", String message}) {
    Get.defaultDialog(
        title: title,
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        textConfirm: "Ok",
        textCancel: "Cancle",
        backgroundColor: Colors.red);
  }

  static showWarningDialog({String title = "Warning", String message}) {
    Get.defaultDialog(
        title: title,
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        textCancel: "Ok",
        backgroundColor: Colors.yellow[700]);
  }
}
