import 'student_task.dart';
import 'dart:io';

void main() {
  var stud1 = ManageStudents();
  programe:
  while (true) {
    print('1. add Student');
    print('2. remove Student');
    print('3. add Subject');
    print('4. Print Student Data');
    print('5. calculate (pass or fail)');
    print('6. exit');

    var order = stdin.readLineSync()!;

    switch (order) {
      case '1':
        print('Enter id , name ,  email , phone , address , age , subject');
        var input = stdin.readLineSync()!.split(' , ');
        stud1.addStudent(
            id: input[0],
            name: input[1],
            email: input[2],
            phone: input[3],
            address: input[4],
            age: int.parse(input[5]),
            subject: {input[6]: double.parse(input[7])});
        break;
      case '2':
        print('Enter the id');
        stud1.removeStudent(stdin.readLineSync()!);
        break;
      case '3':
        print('Enter the id , subject Name and Grade');
        var input = stdin.readLineSync()!.split(' , ');
        stud1.addNewSubject(input[0], input[1], double.parse(input[2]));
        break;
      case '4':
        stud1.studentsData();
        break;
      case '5':
        stud1.calculateStudentGrade(stdin.readLineSync()!);
        break;
      case '6':
        break programe;
    }
  }
}
