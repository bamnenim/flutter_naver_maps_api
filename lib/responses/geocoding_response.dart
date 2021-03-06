import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class GeocodingResponse extends NaverResponse{
  
  final int code;

  GeocodingResponse({
    this.code
  }) : super(code: code);

  factory GeocodingResponse.fromJson(Map json) =>
    GeocodingResponse(code: 0);
}