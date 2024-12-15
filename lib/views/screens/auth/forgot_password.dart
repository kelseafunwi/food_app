import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/views/styles/styles.dart';
import 'package:food_app/views/validators/auth_validators.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:food_app/views/widgets/inputs/auth_input.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forgot password?",
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
                    "Enter your email address and we’ll send you confirmation code to reset your password",
                    style: TextStyle(
                        color: AppColors.neutral60,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Email Address",
                  style: formLabelStyles,
                ),
                const SizedBox(height: 10),
                AuthInput(
                    hintText: "Enter Email",
                    controller: _emailController,
                    validator: emailValidator),
                const SizedBox(
                  height: 150,
                ),
                AppBigButton(
                  content: "Continue",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Add your logic here
                    }
                  },
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
  }
}
