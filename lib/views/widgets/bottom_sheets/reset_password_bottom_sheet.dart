import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/controllers/reset_means_controller.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:food_app/views/widgets/send_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  final ResetMeansController resetMeansController =
      Get.put(ResetMeansController());

  void sendResetCode() {
    // send the code

    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.emailVerification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10), // Add spacing
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Light grey for the handle
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                        color: AppColors.neutral60,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => GestureDetector(
                    onTap: resetMeansController.useWhatsapp,
                    child: SendDetails(
                      iconData: FontAwesomeIcons.squareWhatsapp,
                      sendMeans: "Send via WhatsApp",
                      sendTo: "+12 8347 2838 28",
                      active: resetMeansController.sendViaWhatsapp.value,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() => GestureDetector(
                      onTap: resetMeansController.useEmail,
                      child: SendDetails(
                        sendMeans: "Send via Email",
                        sendTo: "Albertstevano@gmail.com",
                        iconData: FontAwesomeIcons.solidEnvelope,
                        active: resetMeansController.sendViaEmail.value,
                      ),
                    )),
                const SizedBox(height: 25),
                AppBigButton(
                  content: "Continue",
                  onTap: sendResetCode,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
