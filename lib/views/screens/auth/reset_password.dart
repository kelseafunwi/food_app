import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/views/validators/auth_validators.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:food_app/views/widgets/inputs/auth_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:food_app/views/styles/styles.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final OtpFieldController otpController = OtpFieldController();
  late final TextEditingController _newPasswordController;
  late final TextEditingController _newPasswordConfirmationController;
  final _formKey = GlobalKey<FormState>();
  bool _showPasswordNotEqual = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _newPasswordConfirmationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral100),
        ),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.topLeft,
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Reset Password",
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
                  "Your new password must be different from the previously used password",
                  style: TextStyle(
                      color: AppColors.neutral60, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "New Password",
                style: formLabelStyles,
              ),
              const SizedBox(height: 10),
              AuthInput(
                password: true,
                hintText: "Password",
                controller: _newPasswordController,
                validator: passwordValidator,
                onChange: (value) {
                  _showPasswordNotEqual = false;
                  setState(() {});
                },
              ),
              const SizedBox(height: 30),
              Text(
                "Confirm Password",
                style: formLabelStyles,
              ),
              const SizedBox(height: 10),
              AuthInput(
                  password: true,
                  hintText: "Password",
                  controller: _newPasswordConfirmationController,
                  validator: passwordValidator,
                  onChange: (value) {
                    _showPasswordNotEqual = false;
                    setState(() {});
                  }),
              if (_showPasswordNotEqual)
                const Text(
                  "Both password must match",
                  style: TextStyle(color: AppColors.neutral60),
                ),
              const Spacer(),
              AppBigButton(
                content: "Verify Account",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Add your logic here
                  }
                  if (_newPasswordController.text !=
                      _newPasswordConfirmationController.text) {
                    if (kDebugMode) {
                      print("passwords are not equal");
                    }
                    _showPasswordNotEqual = true;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _newPasswordConfirmationController.dispose();
  }
}
