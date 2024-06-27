import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String displayText;

  const CTextField({super.key, required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      alignment: Alignment.centerRight,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Pallete.transparent,
          ),
        ),
      ),
      child: Text(
        displayText,
        style: const TextStyle(
          fontSize: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
