import 'package:flutter/material.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward(); // start the animation
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            width: 200,
          ),
          const SizedBox(height: 10),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Opacity(opacity: animation.value, child: child);
            },
            child: const Text(
              "Your number 1 food App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
