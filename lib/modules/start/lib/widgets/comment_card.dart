
import 'package:feed_social_page/modules/start/lib/model/comments.model.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentsCard extends StatelessWidget {
  CommentsCard({super.key, required this.commentModel});
  
  CommentsModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    style: const TextStyle(fontSize: 20, color: Colors.white),
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
                          Text(commentModel.email.split("@")[0], style: const TextStyle(fontWeight: FontWeight.w600),),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: const Icon(Icons.more_horiz))
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
                              child: const Icon(Icons.favorite_border_outlined),
                            ),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(50),
                              child: const FaIcon(FontAwesomeIcons.comments,size: 20,),
                            ),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(50),
                              child: const FaIcon(FontAwesomeIcons.retweet, size: 22),
                            ),                                          
                          ],
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}