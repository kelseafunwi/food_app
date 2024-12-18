import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/views/widgets/chat_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Chat List",
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral100),
        ),
      )),
      body: SafeArea(
          child: Container(
        alignment: Alignment.topLeft,
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Message",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  textStyle: const TextStyle(
                      color: AppColors.neutral100, fontSize: 16)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ChatItem(
                        profileUrl:
                            'https://avatars.githubusercontent.com/u/122478667?s=400&u=671dabf7a416ce5b081f594984864a8ab1673f8b&v=4',
                        name: 'Geopart Etdsien',
                        lastMessage: "Your Order Just Arrived!",
                        time: '13.47',
                        seenStatus: 3);
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
