import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/model/user.model.dart';
import 'package:feed_social_page/modules/start/lib/store/posts_controller.dart';
import 'package:feed_social_page/modules/start/lib/widgets/post_card.dart';
import 'package:feed_social_page/modules/start/lib/widgets/shimmer_posts.dart';
import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.userModel});

  UserModel userModel;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final postController = Modular.get<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.appBarColor,
        leading: IconButton(
            onPressed: () => Modular.to.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(widget.userModel.username[0], style: TextStyle(fontSize: 40 ,color: ColorApp.bgPrimary),)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.userModel.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "@${widget.userModel.username}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorApp.bgGreyDark),
                          ),
                          Text(
                            widget.userModel.email,
                            style: TextStyle(color: ColorApp.secondColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                    future:
                        postController.getPostsByUserId(widget.userModel.id),
                    builder: (_, value) {
                      if (value.connectionState == ConnectionState.done) {
                        List<PostModel> posts = value.data!;
                        return Text("${posts.length} posts");
                      }else{
                      return Text("...");
                      }
                    })
              
            ],
          ),
          const Divider(color: Colors.grey,),
          Expanded(
                child: FutureBuilder(
                    future:
                        postController.getPostsByUserId(widget.userModel.id),
                    builder: (_, value) {
                      if (value.connectionState == ConnectionState.done) {
                        List<PostModel> posts = value.data!;
                        return ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  PostCard(
                                    colorProfile: Colors.purple,
                                    postModel: posts[index]),
                                  Divider(color: Colors.grey[300],)
                                ],
                              );
                            });
                      }else{
                      return ShimmerPost();
                      }
                    }),
              )
        ],
      ),
    );
  }
}
