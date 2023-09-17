import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import 'package:student/service/service.dart';
import 'package:student/main.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final _formKey=GlobalKey<FormState>();
  String _student_name='';
  String _student_roll='';
  String _stuent_dept='';
  String _student_mobile='';
  String _student_age='';
  String _gender='Male';
  var _service=Service();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title:const Text(
            'Insert Student Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
         child: Container(
           width: 300,
           child:ListView(
             children: [
               Form(
                 key: _formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(
                       height: 30,
                     ),

                     TextFormField(
                       decoration: const InputDecoration(
                           hintText: 'Enter Student Name',
                           labelText: 'Student Name',
                           border: OutlineInputBorder()
                       ),
                       validator: (value){
                         if(value==null || value.isEmpty){
                           return 'Enter student Name';
                         }
                         return null;
                       },
                       onChanged: (value){
                         setState(() {
                           _student_name=value;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),

                     TextFormField(
                       decoration: const InputDecoration(
                           hintText: 'Enter Student RollNo',
                           labelText: 'Student Roll No',
                           border: OutlineInputBorder()
                       ),
                       validator: (value){
                         if(value==null || value.isEmpty){
                           return 'Enter student Roll No';
                         }
                         return null;
                       },
                       onChanged: (value){
                         setState(() {
                           _student_roll=value;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),

                     TextFormField(
                       decoration: const InputDecoration(
                           hintText: 'Enter Student Department',
                           labelText: 'Student  Department',
                           border: OutlineInputBorder()
                       ),
                       validator: (value){
                         if(value==null || value.isEmpty){
                           return 'Enter student Department';
                         }
                         return null;
                       },
                       onChanged: (value){
                         setState(() {
                           _stuent_dept=value;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),

                     TextFormField(
                       decoration: const InputDecoration(
                           hintText: 'Enter Student Moblie',
                           labelText: 'Student Mobile',
                           border: OutlineInputBorder()
                       ),
                       validator: (value){
                         if(value==null || value.isEmpty){
                           return 'Enter student Mobile';
                         }
                         return null;
                       },
                       onChanged: (value){
                         setState(() {
                           _student_mobile=value;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),

                     TextFormField(
                       decoration: const InputDecoration(
                           hintText: 'Enter StudentAge',
                           labelText: 'Student Age',
                           border: OutlineInputBorder()
                       ),
                       validator: (value){
                         if(value==null || value.isEmpty){
                           return 'Enter student Age';
                         }
                         return null;
                       },
                       onChanged: (value){
                         setState(() {
                           _student_age=value;
                         });
                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),

                     Center(
                       child: Column(
                         children: [
                           ListTile(
                               leading: Radio<String>(
                                 value: 'Male',
                                 groupValue: _gender,
                                 onChanged: (value){
                                   setState(() {
                                     _gender=value!;
                                   });
                                 },
                               ),
                               title:const Text('Male')
                           ),
                           ListTile(
                               leading: Radio<String>(
                                 value: 'Female',
                                 groupValue: _gender,
                                 onChanged: (value){
                                   setState(() {
                                     _gender=value!;
                                   });
                                 },
                               ),
                               title:const Text('Female')
                           ),

                         ],
                       ),
                     ),

                     Center(
                       child: Container(
                           width: 300,

                           padding: EdgeInsets.all(30),
                           child: TextButton(
                             style: TextButton.styleFrom(
                                 primary: Colors.black,
                                 backgroundColor: Colors.green,
                                 textStyle: TextStyle(fontSize: 15)
                             ),
                             child: Text('Save'),
                             onPressed: () async{
                               if(_formKey.currentState!.validate()){
                                 /*print(_student_name);
                           print(_student_roll);
                           print(_student_mobile);
                           print(_stuent_dept);
                           print(_student_age);
                           print(_gender);*/
                                 var _student=Student();
                                 _student.name=_student_name;
                                 _student.roll=_student_roll;
                                 _student.dept=_stuent_dept;
                                 _student.mobile=_student_mobile;
                                 _student.age=_student_age;
                                 _student.gender=_gender;
                                 var res=await _service.saverecord(_student);
                                 Navigator.pop(context,res);
                                 //showAlertBox(context, "Student Details Added Successfully");

                               }
                             },
                           )
                       ),
                     )


                   ],
                 ),
               ),
             ],
           )
        ),
      ),
    );
  }
}
showAlertBox(BuildContext context, String S){
  AlertDialog alertDialog=AlertDialog(
    title: Text('Alert Box'),
    content: Text(S),
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context)=>MyApp())));
        },
          child: Text('Ok'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}