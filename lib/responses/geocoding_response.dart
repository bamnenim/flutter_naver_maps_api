import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class GeocodingResponse extends NaverResponse{
  
  final String status;

  GeocodingResponse({
    this.status
  }) : super(status: status);

  factory GeocodingResponse.fromJson(Map json) =>
    GeocodingResponse(status:"OK");
}