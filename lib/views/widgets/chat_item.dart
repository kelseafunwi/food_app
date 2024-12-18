import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ChatItem extends StatelessWidget {
  final dynamic seenStatus;
  final String time;
  final String lastMessage;
  final String name;
  final String profileUrl;

  const ChatItem(
      {super.key,
      required this.profileUrl,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.seenStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: showProfile,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profileUrl),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: redirectToChat,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: AppColors.neutral100,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    lastMessage,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.neutral60)),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: AppColors.neutral60, fontSize: 12)),
              ),
              const SizedBox(height: 15),
              if (seenStatus is bool) ...[
                seenStatus
                    ? const Icon(
                        FontAwesomeIcons.checkDouble,
                        size: 10,
                        color: AppColors.primaryOrange,
                        weight: 1.0,
                      )
                    : const Icon(
                        FontAwesomeIcons.check,
                        size: 10,
                        color: AppColors.primaryOrange,
                        weight: 1.0,
                      ),
              ],
              if (seenStatus is int)
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryOrange, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      seenStatus.toString(),
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        color: Colors.white,
                      )),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  void redirectToChat() {
    if (kDebugMode) {
      print("User clicked on a chat");
      Get.toNamed(AppRoutes.chatDetails);
    }
  }

  void showProfile() {
    if (kDebugMode) {
      print("User clicked on a profile");
    }
  }
}
