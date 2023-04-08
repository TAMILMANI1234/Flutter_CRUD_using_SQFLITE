import 'package:student/db/actions.dart';
import 'package:student/model/Student.dart';

class Service{
  late Actions _actions;

  Service(){
    _actions=Actions();
  }

  saverecord(Student student) async{
    return await _actions.insertrecord("record", student.studentMap());
  }

  display() async{
    return await _actions.display('record');
  }

  delete(int id) async{
    return await _actions.deleterecord('record',id);
  }

  Updatestudent(Student updated_student) async{
    return await _actions.updaterecord('record', updated_student.studentMap());
  }
}