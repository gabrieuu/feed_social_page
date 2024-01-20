import 'package:dio/dio.dart';
import 'package:feed_social_page/modules/home/lib/client_http/client_http.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/home/lib/service/comment_service.dart';


class PostService{
  ClientHttp client;
  
  PostService(this.client);

  Future<List<PostModel>> fetchAllPosts() async{
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await client.get(url) as List; 
    List<PostModel> posts = response.map((e) => PostModel.fromMap(e)).toList();
    return posts;
  }

  getPostByUserId(int userId) async{
    final url = "https://jsonplaceholder.typicode.com/user/$userId/posts";
    final response = await client.get(url) as List; 
    List<PostModel> posts = response.map((e) => PostModel.fromMap(e)).toList();
    return posts;
  }

}