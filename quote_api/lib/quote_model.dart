class DataModel {
  int total;
  int limit;
  int skip;
  List<QuoteModel> quotes;

  DataModel({required this.total, required this.limit, required this.skip, required this.quotes});

  factory DataModel.fromJson(Map<String, dynamic> json){  

    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachQuote in json['quotes']){
      QuoteModel model = QuoteModel.fromJson(eachQuote);
      mQuotes.add(model);
    }

    return DataModel(
      total: json['total'], 
      limit: json['limit'], 
      skip: json['skip'], 
      quotes: mQuotes
    );
  }
}

class QuoteModel{
  int id;
  String quote;
  String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  // map -> model
  factory QuoteModel.fromJson(Map<String, dynamic> json){
    return QuoteModel(
      id: json['id'], 
      quote: json['quote'], 
      author: json['author']
    );
  }

}