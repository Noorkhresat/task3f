class Person {
  String id, name, address;
  int age;

  Person(
      {required this.id,
      required this.name,
      required this.address,
      required this.age});
  // we male the Const. as a required becouse we send the para. as a Named & optional
}

class Student extends Person {
  String email, phone;
  Map<String, double> subject = {};

  Student(
      {required this.email,
      required this.phone,
      required this.subject,
      required String id,
      required String name,
      required String address,
      required int age})
      : super(id: id, name: name, address: address, age: age);

  void addSubject(String name, double grade) {
    subject.addAll({name: grade});
  }

  void sutdentData() {
    print(
        ' Id : $id , Name : $name , Email : $email , Phone : $phone , Age :$age , Address :$address Subject : $subject ');
  }
}

class ManageStudents {
  final List<Student> _student = [];
  //_student is a list of type Student ... (List of type class)

  void addStudent({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required int age,
    required Map<String, double> subject,
  }) {
    _student.add(Student(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
      age: age,
      subject: subject,
    ));
  }

  void removeStudent(String id) {
    _student.removeWhere((element) => element.id == id);
  }

  void studentsData({String? id}) {
    if (id != null) {
      var st = _student.firstWhere((element) => element.id == id);
      print(st);
    } else {
      _student.forEach((element) {
        element.sutdentData();
      });
    }
  }

  void addNewSubject(String id, String subject, double grade) {
    var newSubj = _student.firstWhere((element) => element.id == id);
    newSubj.addSubject(subject, grade);
  }

  void calculateStudentGrade(String id) {
    Map<String, String> cal;
    cal = {};
    var cal1 = _student.firstWhere((element) => id == id);
    cal1.subject.forEach((key, value) {
      if (value >= 50) {
        cal.addAll({key: 'pass'});
      } else {
        cal.addAll({key: 'fail'});
      }
    });
    print(cal);
  }
}
