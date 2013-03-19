import 'dart:html';
import 'dart:uri';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class TaskEdit extends WebComponent {
  Project project;
  Tasks tasks;
  Task task;

  update() {
    //InputElement webTask = query("#edit-task-url");
    InputElement description = query("#edit-task-description");
    Element message = query("#edit-task-message");
    var error = false;
    message.text = '';
    /*
    if (webTask.value.trim() == '') {
      message.text = 'web task is mandatory; ${message.text}';
      error = true;
    }
    */
    if (!error) {
      //task.url = new Uri.fromString(webTask.value);
      task.description = description.value;
      var taskTable = document.query('task-table').xtag;
      taskTable.showTaskEdit = false;
    }
  }

}

