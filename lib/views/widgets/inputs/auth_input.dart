import 'package:flutter/material.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool password;
  final String? labelText;
  final void Function(String)? onChange;

  const AuthInput(
      {super.key,
      required this.controller,
      required this.validator,
      this.password = false,
      this.labelText,
      this.hintText,
      this.onChange});

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autocorrect: true,
        onChanged: widget.onChange,
        controller: widget.controller,
        validator: widget.validator,
        textInputAction: TextInputAction.go,
        style: GoogleFonts.inter(
            textStyle: const TextStyle(
                color: AppColors.neutral100,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
        cursorColor: AppColors.primaryOrange,
        obscureText: widget.password ? _isPasswordHidden : false,
        obscuringCharacter: widget.password ? '*' : '.',
        decoration: InputDecoration(
            labelText: widget.labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.neutral40, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryOrange, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: widget.hintText,
            suffixIcon: widget.password
                ? IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  )
                : null,
            hintStyle: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 12,
                    // color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w500))));
  }
}
