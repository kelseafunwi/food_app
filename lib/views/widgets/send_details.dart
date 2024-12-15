import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SendDetails extends StatelessWidget {
  const SendDetails(
      {super.key,
      required this.iconData,
      required this.sendMeans,
      required this.sendTo,
      required this.active});

  final String sendMeans;
  final String sendTo;
  final bool active;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(
              color: active ? AppColors.primaryOrange : AppColors.neutral60),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Container(
            color: AppColors.neutral20,
            child: Icon(
              iconData,
              color: AppColors.neutral100,
              fill: 1.0,
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sendMeans,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: AppColors.neutral60, fontSize: 13)),
              ),
              const SizedBox(height: 7),
              Text(
                sendTo,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: AppColors.neutral100,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          )),
          if (active)
            Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryOrange,
                ),
                child: const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                  size: 14,
                ))
        ],
      ),
    );
  }
}
