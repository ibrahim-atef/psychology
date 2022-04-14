class BlogsModel{

  String body;
  String imageUrl;
  String title;

  BlogsModel(this.body, this.imageUrl, this.title);

  Map<String, dynamic> toMap() {
    return {
      'body': this.body,
      'imageUrl': this.imageUrl,
      'title': this.title,
    };
  }

  factory BlogsModel.fromJson(map) {
    return BlogsModel(
      map['body'] as String,
       map['imageUrl'] as String,
       map['title'] as String,
    );
  }
}