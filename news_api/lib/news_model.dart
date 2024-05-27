import 'package:flutter/foundation.dart';

class NewsModel{
    String? status;
    List<ArticleModel>? articles;

    NewsModel({this.status, this.articles});

    factory NewsModel.fromJson(Map<String, dynamic> json){

      List<ArticleModel> articlesData = [];

      for(Map<String, dynamic> eachArticles in json['articles']){
        articlesData.add(ArticleModel.fromJson(eachArticles));
      }

      return NewsModel(
        status: json['status'],
        articles: articlesData
      );
    }
}

class ArticleModel{
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    String? publishedAt;
    String? content;

    ArticleModel({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

    factory ArticleModel.fromJson(Map<String, dynamic>  json){
      return ArticleModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
      );
    }
}
