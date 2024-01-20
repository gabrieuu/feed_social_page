import 'package:feed_social_page/core/modules/comment_module.dart';
import 'package:feed_social_page/core/modules/post_module.dart';
import 'package:feed_social_page/core/modules/user_module.dart';
import 'package:feed_social_page/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  
  @override
  List<Module> get imports => [
    PostModule(),
    CommentModule(),
    UserModule(),
  ];
  
  @override
  void routes(RouteManager r) {
    r.module("/home", module: HomeModule());
  }
}