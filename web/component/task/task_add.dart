import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class TaskAdd extends WebComponent {
  Project project;
  Tasks tasks;
  Employees employees = TasksModel.one().employees;

  add() {
    InputElement description = query("#add-task-description");
    SelectElement employeeLookup = query("#employee-lookup");
    Element message = query("#add-task-message");
    var error = false;
    message.text = '';
    if (!error) {
      var task = new Task();
      task.project = project;
      String employeeCode = employeeLookup.value;
      task.employee = TasksModel.one().employees.find(employeeCode);
      task.description = description.value;
      if (tasks.add(task) && task.employee.tasks.add(task)) {
        message.text = 'added';
        var taskTable = document.query('#task-table').xtag;
        taskTable.tasks.order();
      } else {
        message.text = 'task with the same project and employee already exists';
      }
    }
  }

}

