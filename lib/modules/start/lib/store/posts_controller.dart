import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/model/user.model.dart';
import 'package:feed_social_page/modules/start/lib/service/api_photo/api_photo.service.dart';
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
  PostService postService;
  ApiPhoto apiPhotoService;

  @observable
  bool postsLoading = false;

  _PostControllerBase({required this.postService, required this.userService, required this.apiPhotoService}){
    _initController();
  }

  _initController() async{
    postsLoading = true;
    await getAllPosts();
    await getPhotos();
    await _loadUsers(posts);
    postsLoading = false;
  }

  Future<void> getAllPosts() async{
    List<PostModel> postagens = await postService.fetchAllPosts();
    List<int> uniqueUserIds = [];

    for (var post in postagens) {
      if(!uniqueUserIds.contains(post.userId)){
        uniqueUserIds.add(post.userId);
        posts.add(post);
      }
    }
    
  }

  getPhotos() async{
    List<String> urls = await apiPhotoService.searchPhotosUrl(posts);

    for (var i = 0; i < posts.length; i++) {
      posts[i].url = urls[i];
    }
  }

  @action
  Future<List<PostModel>> getPostsByUserId(int id) async{
    var postagens = await postService.getPostByUserId(id);
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