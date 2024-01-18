import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/comments.model.dart';
import 'package:feed_social_page/model/posts.model.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:feed_social_page/store/posts_controller.dart';
import 'package:feed_social_page/view/widgets/comment_card.dart';
import 'package:feed_social_page/view/widgets/post_card.dart';
import 'package:feed_social_page/view/widgets/shimmer_posts.dart';
import 'package:flutter/material.dart';

class DetailsPostPage extends StatelessWidget {
  DetailsPostPage({super.key, required this.postModel});
  PostModel postModel;

  final postController = PostController(service: PostService(DioClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            PostCard(postModel: postModel),
            Divider(color: Colors.black,),
            FutureBuilder(future: postController.getComments(postModel.id), builder: (_, value){
              if(value.connectionState == ConnectionState.done){
                List<CommentsModel> comments = value.data!;
                return Expanded(
                child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (_, index){
                  return Column(
                    children: [
                      CommentsCard(commentModel: comments[index]),
                      Divider()
                    ],
                  );
                }),
            );
              }
              return ShimmerPost();
            })
          ],
        ),
      ),
    );
  }
}