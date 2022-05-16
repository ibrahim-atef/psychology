class BlogsModel{

  String body;
  String imageUrl;
  String title;
  String blogOwnerId;
  var date;

  BlogsModel(this.body, this.imageUrl, this.title,this.blogOwnerId,this.date);

  Map<String, dynamic> toMap() {
    return {
      'body': this.body,
      'imageUrl': this.imageUrl,
      'title': this.title,
      'blogOwnerId': this.blogOwnerId,
      'date': this.date,
    };
  }

  factory BlogsModel.fromJson(map) {
    return BlogsModel(
      map['body'] as String,
       map['imageUrl'] as String,
       map['title'] as String,
       map['blogOwnerId'] as String,
       map['date'] ,
    );
  }
}