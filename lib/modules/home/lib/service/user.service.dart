import 'package:feed_social_page/modules/home/lib/client_http/client_http.dart';
import 'package:feed_social_page/modules/home/lib/model/user.model.dart';

class UserService{

  ClientHttp client;

  UserService({required this.client});

  Future<UserModel> getUserById(int id) async{
    final url = "https://jsonplaceholder.typicode.com/users/$id";
    final response = await client.get(url);
    return UserModel.fromJson(response);
  }
}