import 'package:food_app/bindings/dashboard_binding.dart';
import 'package:food_app/bindings/home_binding.dart';
import 'package:food_app/bindings/login_binding.dart';
import 'package:food_app/views/screens/auth/login_screen.dart';
import 'package:food_app/views/screens/auth/signup_screen.dart';
import 'package:food_app/views/screens/dashboard_screen.dart';
import 'package:food_app/views/screens/error_screen.dart';
import 'package:food_app/views/screens/home_screen.dart';
import 'package:food_app/views/screens/onboarding/onboarding_screen.dart';
import 'package:food_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Route Names
  static const String home = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String onboarding = '/onboarding';
  static const String error = '/error';

  // GetX Pages
  static final routes = [
    GetPage(
      name: splash,
      title: "splash screen",
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: home,
        title: "homepage",
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: error,
      page: () => const ErrorScreen(),
    ),
  ];
}
