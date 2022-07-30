class Comment {
  String uid;
  String owner;
  String title;
  String text;
  Comment(this.uid, this.owner, this.title, this.text);
  factory Comment.fromJson(json) {
    return Comment(json['uid'], json['owner'], json['title'], json['text']);
  }
}