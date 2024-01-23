import 'package:feed_social_page/core/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/modules/start/lib/model/posts.model.dart';
import 'package:feed_social_page/modules/start/lib/service/api_photo/api_cat.service.dart';
import 'package:feed_social_page/modules/start/lib/service/api_photo/api_photo.service.dart';
import 'package:feed_social_page/modules/start/lib/service/posts/posts.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final posts = ConcretePostService(client: DioClient());
  ApiPhoto photo = ApiCat(client: DioClient());
  late PostModel postModel;

  test("deve retornar todos os posts", () async{
    var listas = await posts.fetchAllPosts();
    postModel = listas[0];
  });

  test("deve retornar uma lista de urls", () async{
    var urls = await photo.searchPhotosUrl([1,2,3,4,5]);
  });
}