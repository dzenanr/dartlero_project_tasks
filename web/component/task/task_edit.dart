import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class TaskEdit extends WebComponent {
  Task task;

  update() {
    InputElement description = query("#edit-task-description");
    task.description = description.value;
    var taskTable = query('#task-table').xtag;
    taskTable.tasks.order();
    taskTable.showTaskEdit = false;
  }

}

