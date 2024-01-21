import 'package:feed_social_page/modules/start/lib/store/posts_controller.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
  final controller = Modular.get<PostController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 120,
            decoration: BoxDecoration(
                color: ColorApp.appBarColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          child: const Text(
                    "WeetGram",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                  ))),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search), color: Colors.white,)
                ],
              ),
            ),
          ),
          Observer(builder: (_) {
            return Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 30),
                  children: List.generate(controller.posts.length, (index) {
                    return Column(
                        children: [
                          PostCard(
                            colorProfile: ColorApp.ramdomColor,
                            postModel: controller.posts[index]),
                          const Divider(color: Colors.grey,)
                        ],
                      );
                  }),
                ));
          })
        ],
      ),
    );
  }
}
