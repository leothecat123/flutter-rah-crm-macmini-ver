import 'package:flutter/material.dart';
import 'package:rah_crm_project/components/task_tile.dart';
import 'package:rah_crm_project/models/project_data.dart';
import 'package:provider/provider.dart';
import 'package:rah_crm_project/screens/add_project_screen.dart';

class CampaignListScreen extends StatelessWidget {
  final bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                SizedBox(width: 40),
                Expanded(
                  child: Container(
                    height: 20,
                    width: 300,
                    child: Text('Project Name'),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  child: Container(
                    height: 20,
                    width: 250,
                    child: Text('Project ID'),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Container(
                    height: 20,
                    width: 50,
                    child: Text('Category'),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Container(
                    height: 20,
                    width: 50,
                    child: Text('Creation Date'),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: 20,
                    width: 100,
                    child: Text('Total Leads'),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 30,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black54)),
                    child: Text(
                      '新增項目',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: AddProjectScreen(),
                              ));
                    },
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ProjectData>(
              builder: (context, projectData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskTile(
                      isChecked: projectData.projects[index].selection,
                      taskName: projectData.projects[index].projectName,
                      taskID: projectData.projects[index].projectID,
                      taskCategory: projectData.projects[index].projectCategory,
                      taskDate: projectData.projects[index].creationDate,
                      taskLeads: projectData.projects[index].totalLeads,
                      checkboxCallback: (checkboxState) {
                        projectData
                            .updateProjectCheckbox(projectData.projects[index]);
                      },
                    );
                  },
                  itemCount: (context.watch<ProjectData>().projects.length),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
