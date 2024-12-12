import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/validators/auth_validators.dart';
import 'package:food_app/views/widgets/inputs/auth_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:food_app/views/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: Container(
          alignment: Alignment.topLeft,
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login to your\naccount.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Please sign in to your account ",
                    style: TextStyle(
                        // color: AppColors.secondaryColor,
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Email Address",
                  style: formLabelStyles,
                ),
                const SizedBox(height: 10),
                AuthInput(
                    hintText: "Enter Email",
                    controller: _emailController,
                    validator: emailValidators),
                const SizedBox(height: 12),
                Text(
                  "Password",
                  style: formLabelStyles,
                ),
                const SizedBox(height: 10),
                AuthInput(
                    password: true,
                    hintText: "Password",
                    controller: _passwordController,
                    validator: passwordValidator),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Switching to forgot password page");
                        }
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                      child: const Text(
                        "Forgot password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
