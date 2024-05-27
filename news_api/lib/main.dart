import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_api/news_model.dart';
import 'package:http/http.dart' as httpclient;

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

class MyHomePage extends StatelessWidget {

  Future<NewsModel?> getNews() async{
    NewsModel? newsData;

    String url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ef523d88fc56443b8d735d16f392b0d3"; 

    var response = await httpclient.get(Uri.parse(url));

    if(response.statusCode == 200){
      var mData = response.body;

      var rawData = jsonDecode(mData);

      newsData = NewsModel.fromJson(rawData);
    }

    return newsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('News API'),
      ),
      body: FutureBuilder(
        future: getNews(), 
        builder: (_, snap){
          if(snap.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
          } else if(snap.hasError){
              return Center(child: Text('${snap.error}'),);
          } else if(snap.hasData){
              return snap.data != null ? ListView.builder(
              itemCount: snap.data!.articles!.length,
              itemBuilder: (_, index){

                ArticleModel articlesData = snap.data!.articles![index];

                return snap.data!.articles != null ? ListTile(
                  onTap: (){

                  },
                  title: articlesData.urlToImage != null ? Image.network(articlesData.urlToImage!) : Image.network("https://readynutrition.com/wp-content/uploads/2016/09/top-news.jpg"),
                  subtitle: Text(articlesData.title!),
                ) : Text('No News added');
              }
            ) : Text('No News yet');
          } 
            
          return Container();
          
        }
      )
    );
  }
}
