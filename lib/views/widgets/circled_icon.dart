import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';

class CirculedIcon extends StatelessWidget {
  final Widget icon;
  final void Function()? tapped;

  const CirculedIcon({super.key, required this.icon, required this.tapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neutral40)),
        child: icon,
      ),
    );
  }
}
