import 'package:feed_social_page/client_http/client_http.dart';
import 'package:feed_social_page/model/comments.model.dart';
import 'package:feed_social_page/model/posts.model.dart';


class PostService{
  ClientHttp client;
  
  PostService(this.client);


  Future<List<PostModel>> fetchAllPosts() async{
    const url = "https://jsonplaceholder.typicode.com/posts";
    
    final response = await client.get(url) as List;
    return response.map((e) => PostModel.fromMap(e)).toList();
  }

  Future<List<CommentsModel>> fetchCommentsPosts(int id) async{
    final url = "https://jsonplaceholder.typicode.com/posts/$id/comments";
    final response = await client.get(url) as List;
    return response.map((e) => CommentsModel.fromMap(e)).toList();
  }


}