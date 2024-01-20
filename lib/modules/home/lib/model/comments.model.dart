class CommentsModel {
  int postId;
  int? id;
  String name;
  String email;
  String body;

  CommentsModel(
      {required this.postId,
      this.id,
      required this.name,
      required this.email,
      required this.body});

  static CommentsModel fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      postId: map["postId"],
      id: map["id"],
      name: map["name"],
      email: map["email"],
      body: map["body"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "postId": postId,
      "name": name,
      "email": email,
      "body": body
    };
  }
}
