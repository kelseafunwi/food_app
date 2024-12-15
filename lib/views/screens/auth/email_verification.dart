import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final OtpFieldController otpController = OtpFieldController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTP",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral100),
        ),
      ),
      body: SafeArea(
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
                  "Email verification",
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
                  "Enter the verification code we send you on:\nAlberts******@gmail.com|",
                  style: TextStyle(
                      color: AppColors.neutral60, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 30),
              OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.neutral100,
                    fontWeight: FontWeight.w400),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onChanged: (pin) {
                  if (kDebugMode) {
                    print("Changed: " + pin);
                  }
                },
                onCompleted: (pin) {
                  if (kDebugMode) {
                    print("Completed: $pin");
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Didn’t receive code?",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            color: AppColors.neutral100,
                            fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("resending the code");
                        }
                        otpController.clear();
                      },
                      child: Text(
                        "Resend",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.w600)),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer,
                    color: AppColors.neutral60,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "09.00",
                    style: TextStyle(
                        color: AppColors.neutral60,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 25),
              AppBigButton(
                content: "Continue",
                onTap: () {
                  Get.toNamed(AppRoutes.resetPassword);
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
  }
}
