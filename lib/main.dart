import 'package:crud_sq/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SQLite Example"),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed:() async {

              int i = await  DatabaseHelper.instance.insert({
                DatabaseHelper.columnName: 'Ramim Hossain'
              });
              print('the inserted id is $i');
            } ,child: Text('insert'),color: Colors.grey,),
            FlatButton(onPressed:()async{

              List<Map<String,dynamic>> query = await DatabaseHelper.instance.queryAll();
              print(query);
            } ,child: Text('query'),color: Colors.deepOrange,),

            FlatButton(onPressed:()async{
              int updatedID = await DatabaseHelper.instance.update({
                DatabaseHelper.columnID: 12,
                DatabaseHelper.columnName:"Hridoy"

              });
              print(updatedID);


            } ,child: Text('update'),color: Colors.green,),
            FlatButton(onPressed:()async{

              int rows = await DatabaseHelper.instance.delete(13);
              print(rows);


            } ,child: Text('delete'),color: Colors.red,),


          ],
        ),
      ),

    );
  }
}
