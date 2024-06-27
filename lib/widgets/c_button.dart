import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(80, 80),
        padding: const EdgeInsets.all(10),
        backgroundColor: Pallete.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 40,
          color: Pallete.textColor,
        ),
      ),
    );
  }
}
