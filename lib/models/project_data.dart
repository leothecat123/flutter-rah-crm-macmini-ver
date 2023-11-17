import 'package:flutter/material.dart';
import 'package:rah_crm_project/models/project.dart';

class ProjectData extends ChangeNotifier {
  List<Project> projects = [
    Project(
        projectName: 'TVP1',
        projectID: '123456',
        projectCategory: 'Active',
        creationDate: '2023-11-16',
        totalLeads: 42),
    Project(
        projectName: 'TVP2',
        projectID: '666666123',
        projectCategory: 'Active',
        creationDate: '2023-11-16',
        totalLeads: 15)
  ];

  void updateProjectCheckbox(Project project) {
    project.toggleDone();
    notifyListeners();
  }
}
