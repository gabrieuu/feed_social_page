import 'package:dio/dio.dart';
import 'package:feed_social_page/client_http/client_http.dart';

class DioClient implements ClientHttp{
  var dio = Dio();
  
  @override
  Future<void> get(String url) async{
    final response = await dio.get(url);
    return response.data;
  }

  
}