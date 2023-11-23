import 'package:flutter/material.dart';
import 'package:rah_crm_project/components/task_tile.dart';
import 'package:rah_crm_project/models/project_data.dart';
import 'package:provider/provider.dart';
import 'package:rah_crm_project/screens/add_project_screen.dart';
import 'package:rah_crm_project/models/gsheet_api.dart';
import 'package:rah_crm_project/constants.dart';
import 'package:rah_crm_project/models/user_field.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class CampaignListScreen extends StatelessWidget {
  final bool isChange = false;
  final DateTime currentDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    ProjectData projectData = Provider.of<ProjectData>(context, listen: false);
    String formattedDate = dateFormat.format(currentDate);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 70),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Text(
                        'Project Name',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Text(
                        'Project ID',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Text(
                        'Category',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Text(
                        'Creation Date',
                        style: kCampaignListTitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: Text(
                        'Total Leads',
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
                            await UserSheetsApi.readGetAllData()
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
                            delectBoxCallback: () async {
                              // final rowCount = await UserSheetsApi.getRowCount();
                              final user = User(
                                adName: projectData.projects[index].projectName,
                                adNumber: projectData.projects[index].projectID,
                                adSectId: '',
                                saleType: '',
                                labelId: '',
                                sectId: '',
                                listName:
                                    projectData.projects[index].projectCategory,
                                listId: '',
                                rawId: '',
                                p1Id: '',
                                creationDate: '\'${formattedDate}',
                                action: 'delete',
                                status: '',
                              );
                              await UserSheetsApi.insert([user.toJson()]);
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
