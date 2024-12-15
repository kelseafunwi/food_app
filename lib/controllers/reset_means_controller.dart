import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ResetMeansController extends GetxController {
  var count = 0.obs;
  var sendViaWhatsapp = true.obs;
  var sendViaEmail = false.obs;

  useEmail() {
    sendViaEmail.value = true;
    sendViaWhatsapp.value = false;
    if (kDebugMode) {
      print('switching to email');
    }
  }

  useWhatsapp() {
    sendViaEmail.value = false;
    sendViaWhatsapp.value = true;
    if (kDebugMode) {
      print('switching to whatsapp');
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (kDebugMode) {
      print('Reset controller is ready');
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print('Reset Controller disposed');
    }
  }
}
