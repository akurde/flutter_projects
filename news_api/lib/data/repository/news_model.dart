class NewsModel{
    String? status;
    int? totalResults;
    List<ArticleModel>? articles;

    NewsModel({this.status, this.articles, this.totalResults});

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
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    String? publishedAt;
    String? content;

    ArticleModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

    factory ArticleModel.fromJson(Map<String, dynamic>  json){
      return ArticleModel(
        source: Source.fromJson(json['source']),//json['source'] != null ? Source.fromJson(json['source']) : ,
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

class Source{
  String? id;
  String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json){
       return Source(
        id: json['id'], 
        name: json['name']
      );
  }

  Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      return data;
  }
}
