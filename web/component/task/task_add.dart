import 'dart:html';
import 'dart:uri';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class TaskAdd extends WebComponent {
  Project project;
  Tasks tasks;

  add() {
    InputElement description = query("#add-task-description");
    Element message = query("#add-task-message");
    var error = false;
    message.text = '';
    /*
    if (code.value.trim() == '') {
      message.text = 'web task name is mandatory; ${message.text}';
      error = true;
    }
    */
    if (!error) {
      var task = new Task();
      task.description = description.value;
      if (tasks.add(task)) {
        message.text = 'added';
        var taskTable = document.query('task-table').xtag;
        taskTable.tasks.order();
      } else {
        message.text = 'task with the same project and employee already exists';
      }
    }
  }

}

