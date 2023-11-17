import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final void Function() callList;

  MenuButton({required this.title, required this.callList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: TextButton(
        onPressed: callList,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xff5f5d5a),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}
