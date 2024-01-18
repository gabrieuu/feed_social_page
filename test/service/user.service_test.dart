import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/user.model.dart';
import 'package:feed_social_page/service/user.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("deve retornar um usuario", () async{
    final service = UserService(client: DioClient());

    UserModel user = await service.getUserById(1);
    print(user.toString());

  });
}