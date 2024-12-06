import 'package:food_app/bindings/dashboard_binding.dart';
import 'package:food_app/bindings/home_binding.dart';
import 'package:food_app/bindings/login_binding.dart';
import 'package:food_app/views/screens/auth/login_screen.dart';
import 'package:food_app/views/screens/dashboard_screen.dart';
import 'package:food_app/views/screens/error_screen.dart';
import 'package:food_app/views/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Route Names
  static const String home = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String error = '/error';

  // GetX Pages
  static final routes = [
    GetPage(
        title: "homepage",
        name: home,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: error,
      page: () => const ErrorScreen(),
    ),
  ];
}
