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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // 按钮正常状态的背景颜色
              return Color(0x005f5d5a);
            },
          ),
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white), // 文本颜色
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // 鼠标悬停时的背景颜色
              if (states.contains(MaterialState.hovered)) {
                return Color(0x205f5d5a); // 更改为悬停颜色
              }
              return Colors.white; // 使用默认的透明悬停颜色
            },
          ),
        ),
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
