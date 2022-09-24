import 'package:daily_task/Constants.dart';
import 'package:flutter/material.dart';

class ToDoItems extends StatelessWidget {
  const ToDoItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: tilecolor,
        leading: Icon(Icons.check_box,color: iconcolor,size: 40,),
        title: Text('Do Your Work', style: TextStyle(color: textcolor,decoration: TextDecoration.lineThrough,
            fontSize: 20,fontWeight: FontWeight.w500),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: bgcolor
          ),
          child: IconButton(
            padding: EdgeInsets.all(5),
            onPressed: (){},
            icon: Icon(Icons.delete_outlined,color: iconcolor,),
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}
