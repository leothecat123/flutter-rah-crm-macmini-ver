import 'package:flutter/material.dart';
import 'pop_up_button.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final String taskID;
  final String taskCategory;
  final String taskDate;
  final int taskLeads;
  final Function(bool?) checkboxCallback;
  final void Function() delectBoxCallback;

  const TaskTile({
    required this.isChecked,
    required this.taskName,
    required this.taskID,
    required this.taskCategory,
    required this.taskDate,
    required this.taskLeads,
    required this.checkboxCallback,
    required this.delectBoxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.black54,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 25,
                width: 300,
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 25,
                width: 300,
                child: Text(
                  taskID,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 25,
                width: 50,
                child: Text(
                  taskCategory,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 25,
                width: 100,
                child: Text(
                  taskDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 25,
                child: Text(
                  '$taskLeads',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextButton(
                child: Icon(
                  Icons.delete,
                  color: Colors.black54,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: EdgeInsets.all(30),
                        contentPadding: EdgeInsets.all(30),
                        buttonPadding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                        backgroundColor: Color(0xfff6f6f5),
                        title: Text(
                          'Confirmation',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        content: Text(
                          'Are you sure to delete this campaign?',
                          style: TextStyle(
                            letterSpacing: 0.8,
                            color: Colors.grey,
                          ),
                        ),
                        actions: [
                          popUpButton(
                              buttonText: 'Delete',
                              buttonCallBack: delectBoxCallback),
                          popUpButton(
                            buttonText: 'Cancel',
                            buttonCallBack: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            TextButton(
              child: Icon(
                Icons.edit_document,
                color: Colors.black54,
              ),
              onPressed: () {},
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
