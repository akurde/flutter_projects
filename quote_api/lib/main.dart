import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quote_api/data_model.dart';
import 'package:http/http.dart' as httpClient;

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
  DataModel? mQuotes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotes();
  }

  void getQuotes() async{
    String url = "https://dummyjson.com/quotes";

    var response = await httpClient.get(Uri.parse(url));

    if(response.statusCode == 200){
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);  

      mQuotes = DataModel.fromJson(rawData);
      setState(() {
        
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quote API'),
      ),
      body: Center(
        child: mQuotes != null ? mQuotes!.quotes!.isNotEmpty ? 
          ListView.builder(
            itemCount: mQuotes!.quotes!.length,
            itemBuilder: (_, index){
              return ListTile(
                title: Text('${mQuotes!.quotes[index].quote}'),
                subtitle: Text('${mQuotes!.quotes[index].author}'),
              );
            }) : Text('No Quotes found!') 
               : CircularProgressIndicator()
      ),
    );
  }
}
