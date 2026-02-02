
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Logger {
  static void logger(var message) {
    if(kDebugMode) debugPrint('Victous ::: $message');
  }
  static void showError(String title,String msg) {
    Get.snackbar(title, msg,margin: const EdgeInsets.fromLTRB(5, 20, 10, 5),
        backgroundColor: Colors.white,
        colorText: Colors.black);
  }
  static void showWarningAlert(String title,String msg) {
    Get.snackbar(title, msg,margin: const EdgeInsets.fromLTRB(5, 20, 10, 5),
        backgroundColor: Colors.white,
        // duration: Duration(milliseconds: 500),
        colorText: Colors.black,);
  }
  static void showSucessAlert(String title,String msg) {
    Get.snackbar(title, msg,margin: const EdgeInsets.fromLTRB(5, 20, 10, 5),
        backgroundColor: Colors.white,
        colorText: Colors.black);
  }
}