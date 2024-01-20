import 'package:feed_social_page/modules/home/lib/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/home/lib/service/posts.service.dart';
import 'package:feed_social_page/modules/home/lib/store/comment_controller.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:feed_social_page/modules/home/lib/widgets/comment_card.dart';
import 'package:feed_social_page/modules/home/lib/widgets/post_card.dart';
import 'package:feed_social_page/modules/home/lib/widgets/shimmer_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatelessWidget {
  CommentPage({super.key, required this.postModel});
  PostModel postModel;

  @override
  Widget build(BuildContext context) {
  final commentController = CommentController(postId: postModel.id);

    return Scaffold(
      backgroundColor: ColorApp.bgPrimary,
      appBar: AppBar(
        backgroundColor: ColorApp.lightBlue,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(onPressed: () => Modular.to.pop(), icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: PostCard(postModel: postModel)),
            Expanded(
                child: Observer(
              builder: (_) => (commentController.commentsLoading)
                  ? ShimmerPost()
                  : ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            CommentsCard(
                                commentModel: commentController.comments[index]),
                            Divider(
                              color: Colors.grey[300],
                            )
                          ],
                        );
                      }),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Digite um comentário...",
                      hintStyle: TextStyle(fontSize: 14),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send, color: Colors.grey),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}