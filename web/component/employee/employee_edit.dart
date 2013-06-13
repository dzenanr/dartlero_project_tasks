import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class EmployeeEdit extends WebComponent {
  Employees employees;
  Employee employee;

  update() {
    InputElement email = query("#edit-employee-email");
    employee.email = email.value;
    var employeeTable = query('#employee-table').xtag;
    employeeTable.employees.order();
    employeeTable.showEmployeeEdit = false;
  }
}