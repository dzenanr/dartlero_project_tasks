import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class EmployeeAdd extends WebComponent {
  Employees employees;

  add() {
    InputElement firstName = query("#add-employee-first-name");
    InputElement lastName = query("#add-employee-last-name");
    InputElement email = query("#add-employee-email");
    Element message = query("#add-employee-message");
    var error = false;
    message.text = '';
    if (firstName.value.trim() == '') {
      message.text = 'employee first name is required; ${message.text}';
      error = true;
    }
    if (lastName.value.trim() == '') {
      message.text = 'employee last name is required; ${message.text}';
      error = true;
    }
    if (email.value.trim() == '') {
      message.text = 'employee email is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var employee = new Employee();
	    employee.firstName = firstName.value;
	    employee.lastName = lastName.value;
	    employee.email = email.value;
      if (employees.add(employee)) {
        message.text = 'added';
        var employeeTable = query('#employee-table').xtag;
        employeeTable.employees.order();
      } else {
        message.text = 'employee email already in use';
      }
    }
  }

}