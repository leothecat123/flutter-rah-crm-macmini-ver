class Project {
  bool selection;
  final String projectName;
  final String projectID;
  final String projectCategory;
  final String creationDate;
  final int totalLeads;

  Project(
      {this.selection = false,
      required this.projectName,
      required this.projectID,
      required this.projectCategory,
      required this.creationDate,
      required this.totalLeads});

  void toggleDone() {
    selection = !selection;
  }
}
