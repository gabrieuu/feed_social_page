import 'package:feed_social_page/modules/home/lib/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/service/comment_service.dart';
import 'package:mobx/mobx.dart';
part 'comment_controller.g.dart';

class CommentController = _CommentControllerBase with _$CommentController;

abstract class _CommentControllerBase with Store {

  @observable
  ObservableList<CommentsModel> comments = ObservableList.of([]);
  @observable
  bool commentsLoading = false;

  final service = CommentService(DioClient());

  _CommentControllerBase({required int postId}){
    commentsLoading = true;
    _initController(postId);
    commentsLoading = false;
  }

  _initController(int postId) async{
    List<CommentsModel> commentarios = await service.getComments(postId);
    comments.addAll(commentarios);
  }
}