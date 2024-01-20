import 'package:feed_social_page/core/modules/post_module.dart';
import 'package:feed_social_page/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  
  @override
  List<Module> get imports => [
    PostModule()
  ];
  
  @override
  void routes(RouteManager r) {
    r.module("/home", module: HomeModule());
  }
}