class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
});
  static List<ToDo> todolist(){
    return[
      ToDo(id: '1', todoText:'Morning Walk', isDone: true),
      ToDo(id: '2', todoText:'log in'),
      ToDo(id: '3', todoText:'breakfast'),
      ToDo(id: '4', todoText:'lunch'),
      ToDo(id: '5', todoText:'Internship '),
    ];
  }
}