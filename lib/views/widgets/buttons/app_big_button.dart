import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBigButton extends StatelessWidget {
  final String content;

  final void Function()? onTap;

  const AppBigButton({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            content,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
