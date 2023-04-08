import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import  'package:student/service/service.dart';
import 'package:student/main.dart';

class Update extends StatefulWidget {
  final Student student;
  const Update({Key? key,required this.student}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var _name=TextEditingController();
  var _roll=TextEditingController();
  var _dept=TextEditingController();
  var _age=TextEditingController();
  var _mobile=TextEditingController();
  var _gender=TextEditingController();
  String _receivedgender='Male';
  bool _receiverbool=true;
  var _service=Service();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _name.text=widget.student.name??'';
      _roll.text=widget.student.roll??'';
      _dept.text=widget.student.dept??'';
      _age.text=widget.student.age??'';
      _mobile.text=widget.student.mobile??'';
      _receivedgender=widget.student.gender??'';
         if(_receivedgender == "Female"){
           _receiverbool=false;
           _receivedgender="Female";
         }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Edit Student Details"),
            centerTitle: true,
          ),

      /*body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Student Details",
            style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent
            ),),

            Row(
              children: [
                Text("Student Name"),
                Text(widget.student.name?? '')
              ]
            ),

            Row(
                children: [
                  Text("Student Roll No"),
                  Text(widget.student.roll?? '')
                ]
            ),

            Row(
                children: [
                  Text("Department"),
                  Text(widget.student.dept?? '')
                ]
            ),

            Row(
                children: [
                  Text("Age"),
                  Text(widget.student.age?? '')
                ]
            ),

            Row(
                children: [
                  Text("Gender"),
                  Text(widget.student.gender?? '')
                ]
            ),
            Row(
                children: [
                  Text("Contact"),
                  Text(widget.student.mobile?? '')
                ]
            )
          ],
        )

      ),*/
      body: Container(
        padding: EdgeInsets.all(30),
        width: 400,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Student Name',
                  labelText: 'Student Name'
              ),
            ),



            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _roll,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Roll No',
                  labelText: 'Roll Number'
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _dept,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Department',
                  labelText: 'Department'
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _age,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Age',
                  labelText: 'Age'
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _mobile,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Contact Number',
                  labelText: 'Contact Number'
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Center(
              child: Column(
                children: [
                  ListTile(
                      leading: Radio<String>(
                        value: 'Male',
                        groupValue: _receivedgender,
                        onChanged: (value){
                          setState(() {
                            _gender=value! as TextEditingController;
                          });
                        },
                      ),
                      title:const Text('Male')
                  ),
                  ListTile(
                      leading: Radio<String>(
                        value: 'Female',
                        groupValue: _receivedgender,
                        onChanged: (value){
                          setState(() {
                            _gender=value! as TextEditingController;
                          });
                        },
                      ),
                      title:const Text('Female')
                  ),

                ],
              ),
            ),

            ElevatedButton(
                onPressed:() async{
                  var _student=Student();
                  _student.id=widget.student.id;
                  _student.name=_name.text;
                  _student.roll=_roll.text;
                  _student.dept=_dept.text;
                  _student.mobile=_mobile.text;
                  _student.age=_age.text;
                  _student.gender=_receivedgender;
                  var res=await _service.Updatestudent(_student);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));

                },
                child: const Text("Update")
            )

          ],
        ),
      )
    );
  }
}
