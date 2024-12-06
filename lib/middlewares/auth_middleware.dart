import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    // Check if the user is logged in (replace with your actual authentication logic)
    bool isAuthenticated = _checkIfAuthenticated();

    // If the user is not authenticated, redirect to the login page
    if (!isAuthenticated) {
      return const RouteSettings(name: '/login');
    }

    // If authenticated, proceed to the intended route
    return null;
  }

  // Example function to simulate authentication logic
  bool _checkIfAuthenticated() {
    // Replace this with your actual authentication logic (e.g., token check, session validation)
    return true; // Assume the user is not logged in for demonstration
  }

  // Optional: Modify page bindings dynamically
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    print('AuthMiddleware: Modifying bindings');
    return super.onBindingsStart(bindings);
  }
}
