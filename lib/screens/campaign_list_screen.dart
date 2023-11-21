import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rah_crm_project/components/task_tile.dart';
import 'package:rah_crm_project/models/project_data.dart';
import 'package:provider/provider.dart';
import 'package:rah_crm_project/screens/add_project_screen.dart';
import 'package:rah_crm_project/models/gsheet_api.dart';
import 'package:rah_crm_project/constants.dart';

class CampaignListScreen extends StatelessWidget {
  final bool isChange = false;

  @override
  Widget build(BuildContext context) {
    ProjectData projectData = Provider.of<ProjectData>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                children: [
                  SizedBox(width: 70),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 300,
                      child: Text(
                        'Project Name',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 250,
                      child: Text(
                        'Project ID',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 70),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 50,
                      child: Text(
                        'Category',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 90),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 30,
                      child: Text(
                        'Creation Date',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 120,
                      child: Text(
                        'Total Leads(Coming soon)',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54)),
                      child: Row(
                        children: [
                          Text(
                            'Refresh',
                            style: kCampaignListButtonStyle,
                          ),
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        List<List<String>> receivedData =
                            await UserSheetsApi.getAllData()
                                as List<List<String>>;
                        projectData.addProjectFromData(receivedData);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 30,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54)),
                      child: Row(
                        children: [
                          Text(
                            'Create',
                            style: kCampaignListButtonStyle,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
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
                      return Column(
                        children: [
                          TaskTile(
                            isChecked: projectData.projects[index].selection,
                            taskName: projectData.projects[index].projectName,
                            taskID: projectData.projects[index].projectID,
                            taskCategory:
                                projectData.projects[index].projectCategory,
                            taskDate: projectData.projects[index].creationDate,
                            taskLeads: projectData.projects[index].totalLeads,
                            checkboxCallback: (checkboxState) {
                              projectData.updateProjectCheckbox(
                                  projectData.projects[index]);
                            },
                            delectBoxCallback: () {
                              projectData.removeProject(
                                  projectData.projects[index],
                                  projectData.projects[index].projectName);
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 1,
                            child: Container(
                              color: Colors.black12,
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: (context.watch<ProjectData>().projects.length),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
