import 'package:flutter/material.dart';

class popUpButton extends StatelessWidget {
  final String buttonText;
  final Function() buttonCallBack;

  popUpButton({required this.buttonText, required this.buttonCallBack});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonCallBack,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff5f5d5a)),
      ),
    );
  }
}
