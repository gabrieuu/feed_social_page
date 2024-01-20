import 'dart:math';

import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/home/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/home/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/home/lib/model/user.model.dart';
import 'package:feed_social_page/modules/home/lib/service/user.service.dart';
import 'package:feed_social_page/modules/home/lib/store/users_controller.dart';
import 'package:feed_social_page/modules/home/lib/views/comments_page.dart';
import 'package:feed_social_page/modules/home/lib/views/profile_page.dart';
import 'package:feed_social_page/modules/home/lib/widgets/shimmer_posts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  PostCard({super.key, required this.postModel, required this.colorProfile});

  Color colorProfile;
  PostModel postModel;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final userController = Modular.get<UserController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getUser(widget.postModel.userId);
  }

  @override
  Widget build(BuildContext context) {
    final postModel = widget.postModel;

    return Observer(builder: (_) {
      if (userController.isLoading) {
        return ShimmerPost();
      } else if (userController.userModel != null) {
        return InkWell(
          onTap: () =>  Modular.to.pushNamed("./comments",arguments: postModel),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Modular.to.pushNamed("./profile", arguments: userController.userModel!);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: widget.colorProfile,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        "${userController.userModel?.username[0]}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
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
                              Text(
                                "${userController.userModel?.username}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(50),
                                  child: Icon(Icons.more_horiz))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text("${widget.postModel.body}"),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  userController.curtir();
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: (userController.postLike)
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CommentPage(
                                              postModel: widget.postModel)));
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: FaIcon(
                                  FontAwesomeIcons.comments,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(50),
                                child: FaIcon(FontAwesomeIcons.retweet, size: 22),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "5 comments",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      } else {
        return Center(child: Text("Error loading user"));
      }
    });
  }
}
