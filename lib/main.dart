import 'package:flutter/material.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/screens/error_screen.dart';
import 'package:food_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      home: const SplashScreen(),
      theme: ThemeData(
          // Set the default font for the entire app
          fontFamily: 'Poppins',
          primarySwatch: Colors.orange, // Example color scheme
          textTheme: GoogleFonts.poppinsTextTheme()),
      onUnknownRoute: (settings) => GetPageRoute(
        page: () => const ErrorScreen(),
      ),
    );
  }
}
