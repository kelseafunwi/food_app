import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle continue button press
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
      ),
      child: const Text(
        'Continue',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
