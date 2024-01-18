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
  });

}