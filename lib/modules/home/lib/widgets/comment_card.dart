import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/service/posts.service.dart';
import 'package:feed_social_page/modules/home/lib/widgets/shimmer_posts.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentsCard extends StatelessWidget {
  CommentsCard({super.key, required this.commentModel});
  
  CommentsModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: ColorApp.ramdomColor, borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "${commentModel.email[0]}",
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
                          Text("${commentModel.email}", style: TextStyle(fontWeight: FontWeight.w600),),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(Icons.more_horiz))
                        ],),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text("${commentModel.body}"),
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
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}