import 'package:dio/dio.dart';
import 'package:feed_social_page/modules/home/lib/client_http/client_http.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';

class CommentService{

  ClientHttp client;

  CommentService(this.client);

  Future<List<CommentsModel>> getComments(int postId) async{
    // final List<Future<List<CommentsModel>>> futures = [];

    // for (var post in posts) {
    //   futures.add(fetchCommentsPosts(post.id));
    // }

    // List<List<CommentsModel>> comments = await Future.wait(futures);

    // for(int i = 0; i < posts.length; i++){
    //   posts[i].comments = comments[i];
    // }
    
    // return posts;
    
    var listComments = await fetchCommentsPosts(postId);
    return listComments;
  }

  Future<List<CommentsModel>> fetchCommentsPosts(int postId) async{
    
    final url = "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    final response = await client.get(url) as List;
    return response.map((e) => CommentsModel.fromMap(e)).toList();
  }

  bool addComment(CommentsModel comment){
    final url = "https://jsonplaceholder.typicode.com/posts/${comment.postId}/comments";
    try {
      var response = client.post(url, comment.toMap()) as Response;
      if(response.statusCode == 200){
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}