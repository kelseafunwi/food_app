import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;

  const AuthInput(
      {super.key,
      required this.controller,
      required this.validator,
      this.hintText});

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autocorrect: true,
        autofocus: true,
        controller: widget.controller,
        validator: widget.validator,
        textInputAction: TextInputAction.go,
        style: const TextStyle(
            color: AppColors.darkText,
            fontSize: 12,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 12, color: AppColors.secondaryColor))));
  }
}
