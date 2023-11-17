import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final String taskID;
  final String taskCategory;
  final String taskDate;
  final int taskLeads;
  final Function(bool?) checkboxCallback;

  const TaskTile({
    required this.isChecked,
    required this.taskName,
    required this.taskID,
    required this.taskCategory,
    required this.taskDate,
    required this.taskLeads,
    required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.black54,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 20,
              width: 300,
              child: Text(taskName),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 20,
              width: 300,
              child: Text(taskID),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 20,
              width: 50,
              child: Text(taskCategory),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 20,
              width: 100,
              child: Text(taskDate),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 20,
              width: 100,
              child: Text('$taskLeads'),
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: Icon(Icons.edit),
          ),
          SizedBox(width: 40),
        ],
      ),
    );
  }
}
