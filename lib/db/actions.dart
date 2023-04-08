import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:student/db/connection.dart';

class Actions{
  late  Connection _connection;
  Actions(){
    _connection=Connection();
  }

  //check database is available
  static Database? _database;
  Future<Database?> get database async{
    if(_database !=null){
      return _database;
    }
    else{
      _database=await _connection.setDatabase();
      return _database;
    }
  }

  //insert action

insertrecord(table,data) async{
    var connection=await database;
    return await connection?.insert(table, data);
}

//Display
display(table) async{
    var connection=await database;
    return await connection?.query(table);
}

//Display by roll
searchby(table,roll) async{
  var connection=await database;
  return await connection?.query(table,where: 'roll=?',whereArgs: [roll]);
}

//Edit
updaterecord(table,data) async{
  var connection=await database;
  return await connection?.update(table, data,where: 'id=?',whereArgs: [data['id']]);
}

//delete
deleterecord(table,id) async{
  var connection=await database;
  return await connection?.rawDelete("delete from $table where id=$id");
}

}