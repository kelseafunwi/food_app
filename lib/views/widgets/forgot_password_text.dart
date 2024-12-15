import 'package:flutter/material.dart';
import 'package:food_app/controllers/password_reset_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasswordResetController>();

    return GestureDetector(
      onTap: controller.toggleVisibility,
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
