import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';

class Switcher extends StatelessWidget {
  const Switcher({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            height: 4,
            width: 20,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
            decoration: BoxDecoration(
                color: index == i ? Colors.white : AppColors.neutral50),
          )
      ],
    );
  }
}
