import 'package:dio/dio.dart';
import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/modules/start/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/start/lib/service/comments/i_comment_service.dart';

class ConcreteCommentService implements CommentService{

  ClientHttp client;

  ConcreteCommentService(this.client);

  @override
  Future<List<CommentsModel>> getComments(int postId) async{
    
    final url = "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    final response = await client.get(url) as List;
    return response.map((e) => CommentsModel.fromMap(e)).toList();
  }

  @override
  Future<CommentsModel> addComment(CommentsModel comment) async{
    final url = "https://jsonplaceholder.typicode.com/posts/${comment.postId}/comments";
    var response = await client.post(url, comment.toMap());
    return CommentsModel.fromMap(response.data);
  }
  
}