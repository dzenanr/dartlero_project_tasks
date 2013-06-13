import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class ProjectEdit extends WebComponent {
  Projects projects;
  Project project;

  update() {
    InputElement description = query("#edit-project-description");
    project.description = description.value;
    var projectTable = query('#project-table').xtag;
    projectTable.projects.order();
    projectTable.showProjectEdit = false;
  }
}