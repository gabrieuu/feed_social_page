import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/modules/start/lib/model/user.model.dart';
import 'package:feed_social_page/modules/start/lib/service/users/i_user.service.dart';

class ConcreteUserService implements UserService{

  ClientHttp client;

  ConcreteUserService({required this.client});

  @override
  Future<UserModel> getUserById(int id) async{
    final url = "https://jsonplaceholder.typicode.com/users/$id";
    final response = await client.get(url);
    return UserModel.fromJson(response);
  }
}