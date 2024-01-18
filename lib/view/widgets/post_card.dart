import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/comments.model.dart';
import 'package:feed_social_page/model/posts.model.dart';
import 'package:feed_social_page/model/user.model.dart';
import 'package:feed_social_page/service/user.service.dart';
import 'package:feed_social_page/store/users_controller.dart';
import 'package:feed_social_page/view/details_post_page.dart';
import 'package:feed_social_page/view/widgets/shimmer_posts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatelessWidget {
  PostCard({super.key, required this.postModel});

  PostModel postModel;
  final userController = UserController();

  @override
  Widget build(BuildContext context) { 
    return FutureBuilder(future: userController.initController(postModel.userId), builder: (_, value){
      if(value.connectionState == ConnectionState.done){
        var userModel = value.data!;
        return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "${userModel.username[0]}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("${userModel.username}", style: TextStyle(fontWeight: FontWeight.w600),),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(Icons.more_horiz))
                        ],),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text("${postModel.body}"),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(50),
                              child: Icon(Icons.favorite_border_outlined),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(50),
                              child: FaIcon(FontAwesomeIcons.comments,size: 20,),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(50),
                              child: FaIcon(FontAwesomeIcons.retweet, size: 22),
                            ),                                          
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("5 comments", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                )
              ],
            ));
      }
      return ShimmerPost();
    });
  }
}
