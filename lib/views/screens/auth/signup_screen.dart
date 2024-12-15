import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();

  void _onTermsOfServiceTap() {
    // Navigate to the Terms of Service page or show a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Terms of Service"),
        content: const Text(
          "Here are the Terms of Service. Replace this with the full text or navigate to another page.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _onPrivacyPolicyTap() {
    // Navigate to the Privacy Policy page or show a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Privacy Policy"),
        content: const Text(
          "Here is the Privacy Policy. Replace this with the full text or navigate to another page.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
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
                    "Create your new \naccount.",
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
                    "Create an account to start looking for the food you like",
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
                  "User Name",
                  style: formLabelStyles,
                ),
                const SizedBox(height: 10),
                AuthInput(
                    hintText: "Enter Username",
                    controller: _userNameController,
                    validator: usernameValidator),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: AppColors.primaryOrange,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black),
                          children: [
                            const TextSpan(
                              text: "I agree with the ",
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: AppColors.primaryOrange,
                                    fontWeight: FontWeight.w600),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTermsOfServiceTap,
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: AppColors.primaryOrange,
                                      fontWeight: FontWeight.w600)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onPrivacyPolicyTap,
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                AppBigButton(
                  content: "Register",
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
                      "Already have an account?",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: AppColors.neutral100,
                              fontWeight: FontWeight.w500)),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                )
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
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
