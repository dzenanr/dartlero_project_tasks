part of dartlero_project_tasks;

class Employee extends ConceptEntity<Employee> { 
  String lastName;
  String firstName;
  String _email;
  Tasks tasks = new Tasks();
  
  String get email => _email;
  set email(String email) {
    _email = email;
    if (code == null) {
      code = email;
    }
  }
  
  Employee newEntity() => new Employee();
  
  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    firstName: ${firstName}\n'
           '    lastName: ${lastName}\n'
           '    email: ${email}\n'
           '  }\n';
  }
  
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    entityMap['lastName'] = lastName;
    entityMap['firstName'] = firstName;
    entityMap['email'] = email;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    lastName = entityMap['lastName'];
    firstName = entityMap['firstName'];
    email = entityMap['email'];
  }
}

class Employees extends ConceptEntities<Employee> {
  Employees newEntities() => new Employees();
  Employee newEntity() => new Employee();
}

