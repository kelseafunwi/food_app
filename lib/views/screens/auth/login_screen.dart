import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_asset_images.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/styles/styles.dart';
import 'package:food_app/views/validators/auth_validators.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:food_app/views/widgets/circled_icon.dart';
import 'package:food_app/views/widgets/inputs/auth_input.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

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
        key: _formKey,
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
                        color: AppColors.neutral60,
                        fontWeight: FontWeight.w500),
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
                    validator: emailValidator),
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
                        // action to take here
                        // Get.toNamed(AppRoutes.forgotPassword);

                        //
                      },
                      child: Text(
                        "Forgot password?",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppBigButton(
                  content: "Sign In",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Add your logic here
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.neutral60,
                      width: ((MediaQuery.of(context).size.width - 40) / 3) - 4,
                    ),
                    Text(
                      "Or sign in with",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutral60)),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.neutral60,
                      width: ((MediaQuery.of(context).size.width - 40) / 3) - 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CirculedIcon(
                      icon: Image.asset(
                        AppAssetImages.googleLogo,
                        height: 20,
                        width: 20,
                      ),
                      tapped: () {
                        if (kDebugMode) {
                          print("Signing in via google");
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    CirculedIcon(
                      icon: Image.asset(
                        AppAssetImages.facebookLogo,
                        height: 20,
                        width: 20,
                      ),
                      tapped: () {
                        if (kDebugMode) {
                          print("Signing in via facebook");
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CirculedIcon(
                      icon: const Icon(FontAwesomeIcons.apple),
                      tapped: () {
                        if (kDebugMode) {
                          print("Signing in via apple");
                        }
                        Get.toNamed(AppRoutes.settings);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: AppColors.neutral100,
                              fontWeight: FontWeight.w500)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
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
