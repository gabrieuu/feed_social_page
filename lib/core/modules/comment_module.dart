import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/start/lib/service/comments/comment_service.dart';
import 'package:feed_social_page/modules/start/lib/service/comments/i_comment_service.dart';
import 'package:feed_social_page/modules/start/lib/store/comment_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommentModule extends Module{
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<ClientHttp>(DioClient.new);
    i.addSingleton<CommentService>(() => ConcreteCommentService(i.get()));
    i.add(() => CommentController(i.get()));
  }
}