import 'package:dio/dio.dart';
import 'package:feed_social_page/modules/home/lib/client_http/client_http.dart';

class DioClient implements ClientHttp{
  var dio = Dio();
  
  @override
  Future get(String url) async{
    final response = await dio.get(url);
    return response.data;
  }
  
  @override
  Future<Response> post(String url, Map<String, dynamic> data) async{
    var response = await dio.post(url,data: data);
    return response;
  }


  
}