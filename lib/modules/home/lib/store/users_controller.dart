import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/user.model.dart';
import 'package:feed_social_page/modules/home/lib/service/user.service.dart';
import 'package:mobx/mobx.dart';
part 'users_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {

  UserService service;

  @observable
  bool postLike = false;

  @observable
  bool isLoading = false;

  @observable
  UserModel? userModel;

  _UserControllerBase(this.service);

  getUser(int id) async{
    isLoading = true;
    try {
      userModel = await service.getUserById(id);
    } catch (e) {
      print(e);
    } finally{
      isLoading = false;
    }
  }

  @action
   void curtir ()=> postLike = !postLike;


}