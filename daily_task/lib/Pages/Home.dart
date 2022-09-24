import 'package:daily_task/Constants.dart';
import 'package:daily_task/Widget/ToDO%20Items.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
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
            SizedBox(height: 15,),
            Expanded(child: ListView(
              children: [
                ToDoItems(),
                ToDoItems(),
                ToDoItems(),
                ToDoItems(),
                ToDoItems(),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
