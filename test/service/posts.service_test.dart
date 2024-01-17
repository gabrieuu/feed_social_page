import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/model/posts.model.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final posts = PostService(DioClient());
  late PostModel postModel;

  test("deve retornar todos os posts", () async{
    var listas = await posts.fetchAllPosts();
    postModel = listas[0];
    expect("sunt aut facere repellat provident occaecati excepturi optio reprehenderit", postModel.title);
  });

  test("deve retornar os comentários das postagens", () async{
    var comments = await posts.fetchCommentsPosts(postModel.id);
    expect("id labore ex et quam laborum", comments[0].name);
  });
}