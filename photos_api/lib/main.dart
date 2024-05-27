import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpclient;
import 'package:photos_api/photo_data_model.dart';

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

class MyHomePage extends StatelessWidget{
  Future<PhotoDataModel?> getPhotos() async{

    PhotoDataModel? photoData;

    String url = "https://api.pexels.com/v1/search?query=nature&per_page=1";

    var response = await httpclient.get(Uri.parse(url), headers: {"Authorization" : "Iybr0n2erxR8vBVWQF8lAKlvsaB7MwtAIPUAPca3HOlZRu9WdHbqwZT2"});

    if(response.statusCode == 200){

      var rawData = jsonDecode(response.body);

      photoData = PhotoDataModel.fromJson(rawData);

      return photoData;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Photos and Video API'),
      ),
      body: FutureBuilder(
        future: getPhotos(), 
        builder: (_, snap){
          if(snap.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
          } else if(snap.hasError){
              return Center(child: Text('${snap.error}'),);
          } else if(snap.hasData){
              return snap.data != null ? ListView.builder(
                itemCount: snap.data!.photos!.length,
                itemBuilder: (_,index){
                  Photo eachPhoto = snap.data!.photos![index];
                  return ListTile(
                    
                  );
              }) : Text('data');
          }
          return Container();
        }
      )
    );
  }

  
}
