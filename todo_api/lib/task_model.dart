import 'dart:ffi';

class TaskModel{
  int id;
  String todoTask;
  int completed;
  int userId;

  TaskModel({required this.id, required this.todoTask, required this.completed, required this.userId});

  factory TaskModel.fromJson(Map<String, dynamic> json){
    return TaskModel(
      id: json['id'], 
      todoTask: json['todo'], 
      completed: json['completed'] == true ?  1 : 0, 
      userId: json['userId']
    );
  }
}