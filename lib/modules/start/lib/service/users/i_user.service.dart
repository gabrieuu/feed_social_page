import 'package:feed_social_page/modules/start/lib/model/user.model.dart';

abstract class UserService{
  Future<UserModel> getUserById(int id);
}