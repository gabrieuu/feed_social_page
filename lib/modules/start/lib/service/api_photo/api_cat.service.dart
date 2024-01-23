import 'package:feed_social_page/core/client_http/client_http.dart';
import 'package:feed_social_page/modules/start/lib/service/api_photo/api_photo.service.dart';

class ApiCat extends ApiPhoto{

  ClientHttp client;

  ApiCat({required this.client});

  @override
  Future<List<String>> searchPhotosUrl(List list) async{
    List<Future<dynamic>> futureUrls = [];

    for (var i = 0; i < list.length; i++) {
      futureUrls.add(client.get("https://api.thecatapi.com/v1/images/search"));
    }

    var listPhotos = await Future.wait(futureUrls);
    List<String> url = listPhotos.map((e) => e[0]["url"].toString()).toList();
    return url;
  }

}