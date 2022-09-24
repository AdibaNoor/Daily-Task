import 'package:daily_task/Constants.dart';
import 'package:daily_task/Model/ToDo.dart';
import 'package:daily_task/Widget/ToDO%20Items.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = ToDo.todolist();
  final _todoController = TextEditingController();
  List<ToDo> _foundList =[];

  @override
  void initState() {
    _foundList = todoslist;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Daily-Task',
        style: TextStyle(color: textcolor,fontSize: 28,fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                //search bar
                Container(
                  decoration: BoxDecoration(
                    color: tilecolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value)=> _runFilter(value),
                    cursorColor: textcolor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: iconcolor,),
                      prefixIconColor: iconcolor,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: iconcolor),
                      border: InputBorder.none,
                    ),

                  ),
                ),
                //heading Tasks
                SizedBox(height: 15,),
                Text('Tasks',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: textcolor),),
                //all the tiles
                SizedBox(height: 10,),
                Expanded(child: ListView(
                  children: [
                    for(ToDo todo in _foundList)
                      ToDoItems(todo: todo,
                      onToDoChanged: _handleToDoChanges,
                        onDeleteItem: _deleteToDoItem,
                      )
                  ],
                ),),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                //input
                Expanded(child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: textcolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const[BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0,0),
                      spreadRadius: 0,
                    )]
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new Task',
                      hintStyle: TextStyle(color: tilecolor),
                      border: InputBorder.none,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                ),),
                //plus icon
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tilecolor,
                      minimumSize: Size(50, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      _addToDoItem(_todoController.text);
                    },
                    child: Icon(Icons.add,color: textcolor,size: 30,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _handleToDoChanges(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  void _deleteToDoItem(String id){
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }
  void _addToDoItem(String toDo){
    setState(() {
      todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText:toDo));
    });
    _todoController.clear();
  }
  void _runFilter(String enteredkeyword){
    List<ToDo> result =[];
    if(enteredkeyword.isEmpty){
      result=todoslist;}
    else{
      result = todoslist.where(
              (item) => item.todoText!.toLowerCase().contains(enteredkeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundList = result;
    });

  }
}
