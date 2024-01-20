import 'package:dio/dio.dart';
import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';

class CommentService{

  ClientHttp client;

  CommentService(this.client);

  Future<List<CommentsModel>> getComments(int postId) async{
    
    final url = "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    final response = await client.get(url) as List;
    return response.map((e) => CommentsModel.fromMap(e)).toList();
  }

  Future<CommentsModel> addComment(CommentsModel comment) async{
    final url = "https://jsonplaceholder.typicode.com/posts/${comment.postId}/comments";
    var response = await client.post(url, comment.toMap()) as Response;
    return CommentsModel.fromMap(response.data);

  }
}