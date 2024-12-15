import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  final _isVisible = false.obs;

  bool get isVisible => _isVisible.value;

  void toggleVisibility() {
    _isVisible.value = !_isVisible.value;
  }
}
