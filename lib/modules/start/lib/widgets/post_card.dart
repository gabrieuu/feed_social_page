import 'package:carousel_slider/carousel_slider.dart';
import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/store/posts_controller.dart';
import 'package:feed_social_page/modules/start/lib/views/comments_page.dart';
import 'package:feed_social_page/modules/start/lib/widgets/shimmer_posts.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
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
  final postController = Modular.get<PostController>();
  bool postLike = false;
  @override
  Widget build(BuildContext context) {
    final postModel = widget.postModel;

    return Observer(builder: (_) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Modular.to.pushNamed("./profile",
                      arguments: postController.usersMap[postModel.userId]);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: widget.colorProfile,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "${postController.usersMap[postModel.userId]?.username[0]}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
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
                            "${postController.usersMap[postModel.userId]?.username}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(50),
                              child: const Icon(Icons.more_horiz))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text("${widget.postModel.body}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CarouselSlider(
                          options: CarouselOptions(height: 300.0),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(
                                          color: ColorApp.bgGreyDark, 
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(image: NetworkImage(postModel.url),fit: BoxFit.cover)
                                          ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              postLike = !postLike;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: (postLike)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                  ),
                          ),
                          const SizedBox(
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
                            child: const FaIcon(
                              FontAwesomeIcons.comments,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(50),
                            child: const FaIcon(FontAwesomeIcons.retweet,
                                size: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "5 comments",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}
