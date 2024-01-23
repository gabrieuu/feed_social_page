import 'package:dio/dio.dart';
import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/service/posts/i_posts.service.dart';


class ConcretePostService implements PostService{
  ClientHttp client;
  
  ConcretePostService({required this.client});

  @override
  Future<List<PostModel>> fetchAllPosts() async{
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await client.get(url) as List;
    List<PostModel> posts = response.map((e) => PostModel.fromMap(e)).toList();
    return posts;
  }

  @override
  Future<List<PostModel>> getPostByUserId(int userId) async{
    final url = "https://jsonplaceholder.typicode.com/user/$userId/posts";
    final response = await client.get(url) as List; 
    List<PostModel> posts = response.map((e) => PostModel.fromMap(e)).toList();
    return posts;
  }

}