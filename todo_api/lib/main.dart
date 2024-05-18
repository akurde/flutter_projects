import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'package:todo_api/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TodoModel? mTodos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodos();
  }
  
  void getTodos() async{
    String url = "https://dummyjson.com/todos";
    var response = await httpClient.get(Uri.parse(url));

    if(response.statusCode == 200){
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);

      mTodos = TodoModel.fromJson(rawData);
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('TODO API'),
      ),
      body: Center(
        child: mTodos != null ? mTodos!.todos!.isNotEmpty ?
                  ListView.builder(
                    itemCount: mTodos!.todos!.length,
                    itemBuilder: (_, index){
                      return ListTile(
                        leading: mTodos!.todos[index].completed == 0 ? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box),
                        title: Text(mTodos!.todos[index].todoTask),
                        subtitle: Text('${mTodos!.todos[index].userId}'),
                      );
                  })  
                    : Text('No Todos task added yet') 
                    : CircularProgressIndicator()
      ),
    );
  }
}
