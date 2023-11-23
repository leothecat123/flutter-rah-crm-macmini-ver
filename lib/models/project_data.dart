import 'package:flutter/material.dart';
import 'package:rah_crm_project/models/project.dart';

class ProjectData extends ChangeNotifier {
  List<Project> projects = [];

  void updateProjectCheckbox(Project project) {
    project.toggleDone();
    notifyListeners();
  }

  void removeProject(Project project, adName) {
    project.removeProject(adName);
    projects.remove(project);
    notifyListeners();
  }

  // void addTaskTest() {
  //   Project testList = Project(
  //     projectName: 'test',
  //     projectID: 'test',
  //     projectCategory: 'test',
  //     creationDate: 'test',
  //     totalLeads: 0,
  //   );
  //   projects.add(testList);
  // }

  void addProjectFromData(List<List<String>> data) {
    projects.clear();
    for (int i = 1; i < data.length; i++) {
      String ad_name = data[i][0];
      String project_id = data[i][1];
      String project_category = data[i][6];
      String project_date = data[i][10];
      Project new_project = Project(
        projectName: ad_name,
        projectID: project_id,
        projectCategory: project_category,
        creationDate: project_date,
        totalLeads: 0,
      );
      projects.add(new_project);
    }
    notifyListeners();
  }
}
