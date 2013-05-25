import 'dart:html';
import 'dart:json';

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
    employees.fromJson(parse(json));
  }
  employees.order();
}

loadProjects() {
  String json = window.localStorage['dartlero_projects'];
  if (json != null) {
    projects.fromJson(parse(json));
  } 
  projects.order();
}

load() {
  loadEmployees();
  loadProjects();
}

saveEmployees() {
  window.localStorage['dartlero_employees'] =
      stringify(employees.toJson());
}

saveProjects() {
  window.localStorage['dartlero_projects'] =
      stringify(projects.toJson());
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
}

