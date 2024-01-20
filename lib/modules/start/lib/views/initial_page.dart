import 'package:feed_social_page/core/splash_screen.dart';
import 'package:feed_social_page/modules/start/lib/store/posts_controller.dart';
import 'package:feed_social_page/modules/start/lib/views/home_page.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});

  final controller = Modular.get<PostController>();

    @override
    Widget build(BuildContext context) {
      return Observer(builder: (_) => (controller.commentsLoading)
      ? SplashScreen()
      : DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: [
                HomePage(),
                const Center(child: Text("Tela em construção..."),),
                const Center(child: Text("Tela em construção..."),)
              ],
            ),
          ),
        ),
      );
    }

     Widget menu() {
      return Container(
        color: ColorApp.appBarColor,
        child: TabBar(
          labelColor: ColorApp.bgPrimary,
          unselectedLabelColor: const Color.fromARGB(255, 212, 208, 213),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(5.0),
          labelPadding: const EdgeInsets.all(10),
          dividerHeight: 0,
          indicatorColor: Colors.transparent,
          tabs: const [
            Tab(
              icon: Icon(Icons.home_outlined),
            ),
            Tab(
              icon: Icon(Icons.chat),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      );
     }
}