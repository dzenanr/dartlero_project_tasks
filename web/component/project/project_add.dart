import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class ProjectAdd extends WebComponent {
  Projects projects;

  add() {
    InputElement name = query("#add-project-name");
    InputElement description = query("#add-project-description");
    Element message = query("#add-project-message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'project name is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var project = new Project();
	    project.name = name.value;
	    project.description = description.value;
      if (projects.add(project)) {
        message.text = 'added';
        var projectTable = query('#project-table').xtag;
        projectTable.projects.order();
      } else {
        message.text = 'project name already in use';
      }
    }
  }

}