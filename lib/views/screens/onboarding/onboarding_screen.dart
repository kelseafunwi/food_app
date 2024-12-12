import 'package:flutter/material.dart';
import 'package:food_app/controllers/onboarding_controller.dart';
import 'package:food_app/views/screens/onboarding/onboarding1.dart';
import 'package:food_app/views/screens/onboarding/onboarding2.dart';
import 'package:food_app/views/screens/onboarding/onboarding3.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onboardingController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  final pages = const <Widget>[Onboarding1(), Onboarding2(), Onboarding3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.horizontal,
                controller: onboardingController.pageController,
                children: pages)));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
