import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/start/lib/model/user.model.dart';
import 'package:feed_social_page/modules/start/lib/service/users/concrete_user.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("deve retornar um usuario", () async{
    final service = ConcreteUserService(client: DioClient());
    UserModel user = await service.getUserById(1);
    print(user.toString());

  });
}