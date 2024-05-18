import 'package:todo_api/task_model.dart';

class TodoModel{
  List<TaskModel> todos;
  int total;
  int skip;
  int limit;

  TodoModel({required this.todos, required this.total, required this.skip, required this.limit});

  factory TodoModel.fromJson(Map<String, dynamic> json){

    List<TaskModel> mTodos = [];

    for(Map<String, dynamic> eachTodo in json["todos"]){
      TaskModel mData = TaskModel.fromJson(eachTodo);
      mTodos.add(mData);
    }

    return TodoModel(
      todos: mTodos, 
      total: json['total'], 
      skip: json['skip'], 
      limit: json['limit']
    );
  }
}