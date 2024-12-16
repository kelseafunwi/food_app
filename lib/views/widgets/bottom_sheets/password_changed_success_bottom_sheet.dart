import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_asset_images.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/controllers/reset_means_controller.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/widgets/buttons/app_big_button.dart';
import 'package:food_app/views/widgets/send_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PasswordChangedSuccessBottomSheet extends StatefulWidget {
  const PasswordChangedSuccessBottomSheet({super.key});

  @override
  State<PasswordChangedSuccessBottomSheet> createState() =>
      _PasswordChangedSuccessBottomSheetState();
}

class _PasswordChangedSuccessBottomSheetState
    extends State<PasswordChangedSuccessBottomSheet> {
  final ResetMeansController resetMeansController =
      Get.put(ResetMeansController());

  void sendResetCode() {
    // send the code
    Get.toNamed(AppRoutes.emailVerification);
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
                const SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    AppAssetImages.passwordChangedSuccess,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Password Changed",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Select which contact details should we use to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.neutral60,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 30),
                AppBigButton(
                  content: "Verify Account",
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
