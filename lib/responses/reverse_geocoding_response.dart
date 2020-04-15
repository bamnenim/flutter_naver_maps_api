import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class ReverseGeocodingResponse extends NaverResponse{
  final ResultCode code;

  ReverseGeocodingResponse({
    this.code
  }) : super(code: code);
  
  factory ReverseGeocodingResponse.fromJson(Map json) =>
    ReverseGeocodingResponse(code: ResultCode(0));
}