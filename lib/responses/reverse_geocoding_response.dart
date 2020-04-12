import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class ReverseGeocodingResponse extends NaverResponse{
  final String status;

  ReverseGeocodingResponse(this.status);
  
}