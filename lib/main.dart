import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/controllers/onboarding_controller.dart';
import 'package:food_app/controllers/password_reset_controller.dart';
import 'package:food_app/controllers/reset_means_controller.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/screens/error_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.lazyPut(() => OnboardingController());
  Get.lazyPut(() => PasswordResetController());
  Get.lazyPut(() => ResetMeansController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          fontFamily: 'Inter',
          textTheme: GoogleFonts.interTextTheme().apply(
              bodyColor: AppColors.neutral100,
              displayColor: AppColors.neutral100)),
      onUnknownRoute: (settings) => GetPageRoute(
        page: () => const ErrorScreen(),
      ),
    );
  }
}
