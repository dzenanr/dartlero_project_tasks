import 'dart:html';
import 'dart:convert';
import 'package:web_ui/web_ui.dart';
import 'package:dartlero/dartlero.dart';
import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';

TasksModel tasksModel;
Employees employees;
Projects projects;

loadEmployees() {
  String json = window.localStorage['dartlero_employees'];
  if (json == null) {
    tasksModel.init();
  } else {
    employees.fromJson(JSON.decode(json));
  }
  employees.order();
}

loadProjects() {
  String json = window.localStorage['dartlero_projects'];
  if (json != null) {
    projects.fromJson(JSON.decode(json));
  }
  projects.order();
}

load() {
  loadEmployees();
  loadProjects();
}

saveEmployees() {
  window.localStorage['dartlero_employees'] =
      JSON.encode(employees.toJson());
}

saveProjects() {
  window.localStorage['dartlero_projects'] =
      JSON.encode(projects.toJson());
}

save() {
  saveEmployees();
  saveProjects();
}

main() {
  //tasksModel = new TasksModel();
  // using singleton (one object only) pattern http://en.wikipedia.org/wiki/Singleton_pattern
  tasksModel = TasksModel.one();
  employees = tasksModel.employees;
  projects = tasksModel.projects;
  //tasksModel.init(); // comment load to reinit
  load();
  //tasksModel.display();
  employees.internalList = toObservable(employees.internalList);
  projects.internalList = toObservable(projects.internalList);
}

