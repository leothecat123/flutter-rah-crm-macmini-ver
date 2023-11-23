import 'package:flutter/material.dart';
import 'package:rah_crm_project/models/user_field.dart';
import '../components/project_input.dart';
import 'package:rah_crm_project/models/gsheet_api.dart';

class AddProjectScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController handledByController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Create New Project',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: <Widget>[
                  ProjectInput(
                    fieldTitle: 'Project Name:',
                    controller: nameController,
                    validator: (value) {
                      return value != null && value.isEmpty
                          ? 'Please enter Project Name'
                          : null;
                    },
                  ),
                  ProjectInput(
                    fieldTitle: 'Project ID:',
                    controller: idController,
                    validator: (value) {
                      return value != null && value.isEmpty
                          ? 'Please enter Project ID'
                          : null;
                    },
                  ),
                  ProjectInput(
                    fieldTitle: 'Project Category:',
                    controller: categoryController,
                    validator: (value) {
                      return value != null && value.isEmpty
                          ? 'Please enter Project Category'
                          : null;
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ProjectInput(
                    fieldTitle: 'Creation Date:',
                    controller: dateController,
                    validator: (value) {
                      return value != null && value.isEmpty
                          ? 'Please enter Creation Date'
                          : null;
                    },
                  ),
                  ProjectInput(
                    fieldTitle: 'Handled By:',
                    controller: handledByController,
                    validator: (value) {
                      return value != null && value.isEmpty
                          ? 'Please enter Staff Name'
                          : null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () async {
                  final form = formKey.currentState!;
                  final isValid = form.validate();
                  if (isValid) {
                    // final rowCount = await UserSheetsApi.getRowCount();
                    final user = User(
                      adName: nameController.text,
                      adNumber: idController.text,
                      adSectId: '',
                      saleType: '',
                      labelId: '',
                      sectId: '',
                      listName: categoryController.text,
                      listId: '',
                      rawId: '',
                      p1Id: '',
                      creationDate: '\'${dateController.text}',
                      action: 'add',
                      status: '',
                    );
                    await UserSheetsApi.insert([user.toJson()]);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  color: Colors.black54,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
