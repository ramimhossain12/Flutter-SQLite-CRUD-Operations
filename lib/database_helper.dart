import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper{

 static final _dbName = 'myDatabase.db';
 static final _dbVersion = 1;
 static final _tableName = 'myTable';
 static final columnID= '_id';
 static final columnName = 'name';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

 static Database _database;

 Future<Database> get database async{
   if(_database!=null) return _database;

   _database = await _instatiateDatabase();
   return _database;
 }

  _instatiateDatabase() async{

     Directory  directory = await getApplicationDocumentsDirectory();
     String path = join(directory.path,_dbName);
     return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version){

   db.execute(

     ''' 
    CREATE TABLE $_tableName (
    $columnID INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL )
     '''
     
   );

  }



  // for example
 // id = 1;
 // name ='ramim'


 //for insert
  Future<int> insert(Map<String,dynamic> row)async{

   Database db = await instance.database;
   return await db.insert(_tableName, row);

  }



// for query
  Future<List<Map<String,dynamic>>> queryAll() async{

    Database db = await instance.database;
    return await db.query(_tableName);

  }

// for update
  Future<int> update(Map<String,dynamic> row)async{
    Database db = await instance.database;
    int id = row[columnID];
   return await db.update(_tableName, row,where:'$columnID =?  $columnName = ?',whereArgs: [id]);
  }

  //for delete
  Future<int >delete(int id)async{
  Database db = await instance.database;
  return await db.delete(_tableName,where:'$columnID=?,whereArg:[id]');

  }


 

}