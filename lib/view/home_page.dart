import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:feed_social_page/store/posts_controller.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:feed_social_page/view/details_post_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'widgets/post_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = PostController(service: PostService(DioClient()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 120,
            decoration: BoxDecoration(
                color: ColorApp.lightBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          child: Text(
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
                  children: List.generate(controller.posts.length, (index) {
                    return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsPostPage(postModel: controller.posts[index])));
                            },
                            child: PostCard(postModel: controller.posts[index])
                          ),
                          Divider(color: Colors.grey[300],)
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
