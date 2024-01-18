import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/comments.model.dart';
import 'package:feed_social_page/model/posts.model.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:mobx/mobx.dart';
part 'posts_controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  
  @observable
  ObservableList<PostModel> posts= ObservableList.of([]);
  
  PostService service;


  _PostControllerBase({required this.service}){
    _initController();
  }

  _initController() async{
    var postagens = await service.fetchAllPosts();
    posts.addAll(postagens);
  }

  Future<List<CommentsModel>> getComments(int postId) async{
    var listComments = service.fetchCommentsPosts(postId);
    return listComments;
  }

}