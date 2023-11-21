import 'package:flutter/material.dart';

class ProjectInput extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  ProjectInput(
      {required this.fieldTitle, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  fieldTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 3))),
                textAlign: TextAlign.center,
                validator: validator,
                onChanged: (newText) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
