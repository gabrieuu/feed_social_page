import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';

abstract class PostService{
  Future<List<PostModel>> fetchAllPosts();
  Future<List<PostModel>> getPostByUserId(int userId);
}