abstract class ClientHttp{

  Future get(String url) async {}

  Future post(String url, Map<String, dynamic> data) async{}
}