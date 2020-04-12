import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:http/http.dart';

abstract class NaverRequest{
  Client httpClient;
  String _clientId;
  String _clientSecret;

  NaverRequest(this.httpClient){
    httpClient = Client();
  }

  Future<NaverResponse> call();
  String buildUrl();
  Map<String, dynamic> buildQueryParmas();

  String buildQueryParamsToUriString(Map params) {
    final query = [];
    params.forEach((key, val) {
      if (val != null) {
        if (val is Iterable) {
          query.add("$key=${val.map((v) => v.toString()).join(",")}");
        } else {
          query.add('$key=${val.toString()}');
        }
      }
    });
    return query.join('&');
  }
  
  Future<Response> getHttpResponse(String url) =>
    httpClient.get(url, headers: _getNaverApiHeader());  


  Map<String, String> _getNaverApiHeader() => {
    "X-NCP-APIGW-API-KEY-ID": _clientId,
    "X-NCP-APIGW-API-KEY": _clientSecret
  };
}