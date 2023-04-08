import 'package:flutter/material.dart';
import 'package:student/screens/display.dart';
import 'package:student/screens/insert.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Sqlite CRUD Operations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /*late List<Student> _studentlist;
  final _service=Service();

  getRecord() async{
    var students=await _service.display();
    print(students);
    students.forEach
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite CRUD Operations'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            const SizedBox(
              height: 300,
            ),
            const Text(
                "Students Record",
                style: TextStyle(
                  fontSize: 30
                ),
            ),
            const SizedBox(
              height: 40,
            ),

            Container(
              child:TextButton(
                child: Text('Get Record', style: TextStyle(fontSize: 25)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Display()));
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    elevation: 2,
                    backgroundColor: Colors.amber),
              ),
            ),
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Insert()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

}
