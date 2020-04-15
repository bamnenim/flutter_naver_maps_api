import 'package:flutter_naver_maps_api/requests/naver_request.dart';
import 'package:flutter_naver_maps_api/responses/directions5_response.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:http/http.dart';

class Directions5Request extends NaverRequest{
  Client httpClient;
  
  Directions5Request({
    this.httpClient,
  }) : super(httpClient);

  Future<NaverResponse> call() async => 
    Directions5Response.fromJson((await httpClient.get('url')).body);

  @override
  Map<String, dynamic> buildQueryParmas() {
    // TODO: implement buildQueryParmas
    return null;
  }

  @override
  String buildUrl() {
    // TODO: implement buildUrl
    return null;
  }
}