import 'package:feed_social_page/modules/home/lib/client_http/client_http.dart';
import 'package:feed_social_page/modules/home/lib/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/service/posts.service.dart';
import 'package:feed_social_page/modules/home/lib/store/posts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostModule extends Module{

  @override
  void exportedBinds(Injector i) {
    i.add<ClientHttp>(DioClient.new);
    i.add(() => PostService(i.get()));
    i.addLazySingleton(() => PostController(service: i.get()));
  }

}