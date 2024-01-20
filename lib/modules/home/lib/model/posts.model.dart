import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/user.model.dart';
import 'package:flutter/material.dart';

class PostModel {
  int userId;
  int id;
  String title;
  String body;
  List<CommentsModel> comments = [];
  
  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      });

  static PostModel fromMap(Map<String, dynamic> map, ) {
    return PostModel(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"],
    );
  }
}
