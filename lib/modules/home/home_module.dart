import 'package:feed_social_page/modules/home/lib/views/comments_page.dart';
import 'package:feed_social_page/modules/home/lib/views/initial_page.dart';
import 'package:feed_social_page/modules/home/lib/views/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => InitialPage());
    r.child("/comments", child: (_) => CommentPage(postModel: r.args.data));
    r.child("/profile", child: (_) => ProfilePage(userModel: r.args.data));
  }

}