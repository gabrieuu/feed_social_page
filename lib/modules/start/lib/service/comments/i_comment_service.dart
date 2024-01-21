import 'package:feed_social_page/modules/start/lib/model/comments.model.dart';

abstract class CommentService{
  Future<List<CommentsModel>> getComments(int postId);
  Future<CommentsModel> addComment(CommentsModel comment);
}