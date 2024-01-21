import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/model/user.model.dart';
import 'package:feed_social_page/modules/start/lib/service/posts/i_posts.service.dart';
import 'package:feed_social_page/modules/start/lib/service/users/i_user.service.dart';
import 'package:mobx/mobx.dart';
part 'posts_controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  
  @observable
  ObservableList<PostModel> posts= ObservableList.of([]);
  ObservableMap<int, UserModel> usersMap = ObservableMap();
  
  UserService userService;
  PostService service;

  @observable
  bool commentsLoading = false;

  _PostControllerBase({required this.service, required this.userService}){
    _initController();
  }

  _initController() async{
    commentsLoading = true;
    await getAllPosts();
    await _loadUsers(posts);
    commentsLoading = false;
  }

  Future<void> getAllPosts() async{
    List<PostModel> postagens = await service.fetchAllPosts();
    var uniqueUserIds = [];

    for (var post in postagens) {
      if(!uniqueUserIds.contains(post.userId)){
        uniqueUserIds.add(post.userId);
        posts.add(post);
      }
    }
  }

  @action
  Future<List<PostModel>> getPostsByUserId(int id) async{
    var postagens = await service.getPostByUserId(id);
    return postagens;
  }

  _loadUsers(List<PostModel> postagens) async{
    
    var userFutures = postagens.map((post) => userService.getUserById(post.userId));

    List<UserModel> loadedUsers = await Future.wait(userFutures);

    for (var i = 0; i < postagens.length; i++) {
      usersMap[postagens[i].userId] = loadedUsers[i];
    }

  }


}