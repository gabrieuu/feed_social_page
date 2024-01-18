import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/comments.model.dart';
import 'package:feed_social_page/model/posts.model.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:feed_social_page/store/posts_controller.dart';
import 'package:feed_social_page/utils/colors_app.dart';
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
      
      backgroundColor: ColorApp.bgPrimary,
      appBar: AppBar(backgroundColor: ColorApp.lightBlue,iconTheme: IconThemeData(color: Colors.white),),
      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              child: PostCard(postModel: postModel)),

            Expanded(
              child: FutureBuilder(future: postController.getComments(postModel.id), builder: (_, value){
                if(value.connectionState == ConnectionState.done){
                  List<CommentsModel> comments = value.data!;
                  return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, index){
                    return Column(
                      children: [
                        CommentsCard(commentModel: comments[index]),
                        Divider(color: Colors.grey[300],)
                      ],
                    );
                  });
                }
                return ShimmerPost();
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Digite um comentário...",
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.send,color: Colors.grey,)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}