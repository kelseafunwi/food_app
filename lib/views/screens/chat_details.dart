import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  void callUser() {
    if (kDebugMode) {
      print('starting call action');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Stevano Clirover",
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral100),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: callUser,
            child: const HeroIcon(
              HeroIcons.phone,
              color: AppColors.neutral100,
              size: 20,
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: showProfile,
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/id/1652166108/photo/aerial-view-of-woman-standing-on-top-of-the-mountain-ridge-augstmatthorn.jpg?s=2048x2048&w=is&k=20&c=dq-fOOh8CqaC3KQnxorNaBJ2XmqyqxfB3xULZQjC0OE='),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Stevano Clirover',
                              style: TextStyle(
                                  color: AppColors.neutral100,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onLongPress: () {
                                if (kDebugMode) {
                                  print("User has longed pressed");
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: const BoxDecoration(
                                    color: AppColors.greyBackground,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Text(
                                  'Just to order',
                                  style: TextStyle(
                                    color: AppColors.neutral100,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '09.00',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.neutral60)),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }

  void showProfile() {
    if (kDebugMode) {
      print('show profile');
    }
  }
}
