import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class EmployeeTable extends WebComponent {
  Employees employees;
  Employee employee;

  bool showEmployeeAdd = false;
  bool showEmployeeEdit = false;
  bool showEmployeeTasks = false;

  add() {
    ButtonElement addEmployee = query("#addEmployeeButton");
    if (addEmployee.text == 'Show Add') {
      showEmployeeAdd = true;
      addEmployee.text = 'Hide Add';
    } else {
      showEmployeeAdd = false;
      addEmployee.text = 'Show Add';
    }
  }

  edit(employee) {
    showEmployeeEdit = true;
    this.employee = employee;
  }

  delete(employee) {
    employees.remove(employee);
    showEmployeeTasks = false;
  }

  showTasks(employee) {
    showEmployeeTasks = true;
    this.employee = employee;
  }

}