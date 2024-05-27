class PhotoDataModel{
    int? page;
    int? per_page;
    List<Photo>? photos;
    int? totalResults;
    String? nextPage;

    PhotoDataModel({this.page, this.per_page, this.photos, this.totalResults, this.nextPage});

    factory PhotoDataModel.fromJson(Map<String, dynamic> json){
        List<Photo> mPhoto = [];

        for(Map<String, dynamic> eachPhoto in json['photos']){
            mPhoto.add(Photo.fromJson(eachPhoto));
        }

        return PhotoDataModel(
          page: json['page'],
          per_page: json['peer_page'],
          totalResults: json['totalResults'],
          nextPage: json['nextPage'],
          photos: mPhoto
        );
    }
}

class Photo{
    int? id;
    int? width;
    int? height;
    String? url;
    String? photographer;
    String? photographerUrl;
    int? photographerId;
    String? avg_color;
    bool? liked;
    String? alt;
    List<Source>? src;

    Photo({this.id, this.width, this.height, this.url, this.photographer, this.photographerUrl, this.photographerId, this.avg_color, this.liked, this.alt, this.src});

    factory Photo.fromJson(Map<String, dynamic> json){
        return Photo(
          id: json['id'],
          width: json['width'],
          height : json['height'],
          url : json['url'],
          photographer : json['photographer'],
          photographerUrl: json['photographer_url'],
          photographerId: json['photographer_id'],
          avg_color:json['avg_color'],
          liked:json['liked'],
          alt:json['alt'],
          src:json['src'],
        );
    }
}

class Source{
    String? original;
    String? large2x;
    String? large;
    String? medium;
    String? small;
    String? potrait;
    String? landscape;
    String? tiny;

    Source({this.original, this.large2x, this.large, this.medium, this.small, this.potrait, this.landscape, this.tiny});

    factory Source.fromJson(Map<String, dynamic> json){
      return Source(
        original : json['landscape'],
        large2x : json['large'],
        large : json['large2x'],
        medium : json['medium'],
        small : json['original'],
        potrait : json['portrait'],
        landscape : json['small'],
        tiny : json['tiny'],
      );
    }
}