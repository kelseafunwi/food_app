import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  void skip() {
    pageController.animateToPage(2,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void next() => pageController.nextPage(
      duration: const Duration(seconds: 1), curve: Curves.easeInOut);
}
