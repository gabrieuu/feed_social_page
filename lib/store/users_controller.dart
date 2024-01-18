import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/user.model.dart';
import 'package:feed_social_page/service/user.service.dart';
import 'package:mobx/mobx.dart';
part 'users_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {

  UserService service = UserService(client: DioClient());

  Future<UserModel> initController(int id) async{
    return await service.getUserById(id);
  }


}