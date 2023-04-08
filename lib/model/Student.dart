class Student{
  int? id;
  String? name;
  String? roll;
  String? mobile;
  String? age;
  String? dept;
  String? gender;

  studentMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['name']=name!;
    mapping['roll']=roll!;
    mapping['mobile']=mobile!;
    mapping['age']=age!;
    mapping['dept']=dept!;
    mapping['gender']=gender!;
    return mapping;
  }
}