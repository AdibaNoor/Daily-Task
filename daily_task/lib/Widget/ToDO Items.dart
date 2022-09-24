import 'package:daily_task/Constants.dart';
import 'package:flutter/material.dart';

import '../Model/ToDo.dart';

class ToDoItems extends StatelessWidget {
  const ToDoItems({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem}) : super(key: key);
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: tilecolor,
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank
          ,color: iconcolor,size: 40,),
        title: Text(todo.todoText!, style: TextStyle(color: textcolor,decoration: todo.isDone? TextDecoration.lineThrough : null,
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
            onPressed: (){
              onDeleteItem(todo.id);
            },
            icon: Icon(Icons.delete_outlined,color: tilecolor,),
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}
