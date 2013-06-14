import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class TaskTable extends WebComponent {
  Employee employee;
  Project project;
  Tasks tasks;
  Task task;
  @observable
  bool showTaskAdd = false;
  @observable
  bool showTaskEdit = false;

  add() {
    ButtonElement addTask = query("#addTaskButton");
    if (addTask.text == 'Show Add') {
      showTaskAdd = true;
      addTask.text = 'Hide Add';
    } else {
      showTaskAdd = false;
      addTask.text = 'Show Add';
    }
  }

  edit(Task task) {
    showTaskEdit = true;
    this.task = task;
  }

  delete(Task task) {
    tasks.remove(task);
    task.employee.tasks.remove(task);
  }

}