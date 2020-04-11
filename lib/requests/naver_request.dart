import 'package:flutter_naver_maps_api/responses/naver_response.dart';

abstract class NaverRequest{
  Future<NaverResponse> call();
  String buildUrl();
  String buildQueryParamsToUriString();
}