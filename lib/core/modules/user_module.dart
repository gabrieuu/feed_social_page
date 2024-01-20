import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/service/user.service.dart';
import 'package:feed_social_page/modules/home/lib/store/users_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module{
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<ClientHttp>(DioClient.new);
    i.addSingleton(() => UserService(client: i.get()));
    i.add(() => UserController(i.get()));
  }
}