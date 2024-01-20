import 'package:feed_social_page/modules/home/lib/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/home/lib/service/posts.service.dart';
import 'package:mobx/mobx.dart';
part 'posts_controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  
  @observable
  ObservableList<PostModel> posts= ObservableList.of([]);
  
  PostService service;

  @observable
  bool commentsLoading = false;

  _PostControllerBase({required this.service}){
    _initController();
  }

  _initController() async{
    commentsLoading = true;
    var postagens = await service.fetchAllPosts();
    posts.addAll(postagens);
    commentsLoading = false;
  }

  Future<List<PostModel>> getPostsByUserId(int id) async{
    var postagens = await service.getPostByUserId(id);
    return postagens;
  }

}