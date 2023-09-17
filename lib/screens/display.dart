import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import 'package:student/service/service.dart';
import 'package:student/main.dart';
import 'package:student/screens/update.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late List<Student> _studentlist;
  int temp=0;
  final _Service=Service();
  bool _visibility=false;
  int _count=0;
  getRecord() async{
    var students= await _Service.display();



    students.forEach((i){
      var structure=Student();
      structure.id=i['id'];
      structure.name=i['name'];
      structure.roll=i['roll'];
      structure.dept=i['dept'];
      structure.mobile=i['mobile'];
      structure.age=i['age'];
      structure.gender=i['gender'];
      _studentlist.add(structure);
      setState(() {
        _count=_count+1;
      });
      isvisible();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _studentlist=<Student>[];

    getRecord();
  }

  isvisible(){
    if(_count>0){
      setState(() {
        _visibility=true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Records'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: (_visibility==false)? Center(
        child: Text("No data",style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.red
        ),),
      ):ListView.builder(
        itemCount: _studentlist.length,
          itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Column(
                    children: [
                      /*Text(_studentlist[index].id.toString()?? ''),
                      Text(_studentlist[index].name ?? ''),
                      Text(_studentlist[index].roll ?? ''),
                      Text(_studentlist[index].dept ?? ''),
                      Text(_studentlist[index].mobile ?? ''),
                      Text(_studentlist[index].age ?? ''),
                      Text(_studentlist[index].gender ?? ''),*/

                      Row(
                        children: [
                          Container(
                            child: Text('S.No :'),
                          ),
                          Container(
                            child: Text(_studentlist[index].id.toString()?? ''),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Student Name     : '),
                              ),
                              Container(
                                child: Text(_studentlist[index].name?? ''),
                              )
                            ],
                          ),

                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child:const Text('Roll No                  : '),
                            ),
                            Container(
                              child: Text(_studentlist[index].roll?? ''),
                            )
                          ],
                        ),

                      ),

                     const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child:const Text('Department          : '),
                            ),
                            Container(
                              child: Text(_studentlist[index].dept?? ''),
                            )
                          ],
                        ),

                      ),


                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child:const Text('Age                         : '),
                            ),
                            Container(
                              child: Text(_studentlist[index].age?? ''),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('Gender                   : '),
                            ),
                            Container(
                              child: Text(_studentlist[index].gender?? ''),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('Mobile Number    : '),
                            ),
                            Container(
                              child: Text(_studentlist[index].mobile?? ''),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: Center(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               ElevatedButton(
                                   onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(student: _studentlist[index],)));
                                   },
                                   child: Text('Edit'),
                                 style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.yellow,
                                     foregroundColor: Colors.black
                                 ),
                               ),
                               ElevatedButton(
                                   onPressed: (){

                                          int? id=_studentlist[index].id;
                                          String? name=_studentlist[index].name;
                                          var res= _Service.delete(id!);
                                          Navigator.pop(context,res);


                                   },
                                   child: Text('Delete'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                        foregroundColor: Colors.white
                                    ),

                               ),

                             ],
                           ),
                        ),
                      )




                    ],
                  ),
                  ),
                );

          }
      ),

    );
  }

}
