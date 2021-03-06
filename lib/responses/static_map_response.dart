import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class StaticMapResponse extends NaverResponse{
  final int code;

  StaticMapResponse({
    this.code
  }) : super(code: code);

  factory StaticMapResponse.fromJson(Map json) =>
    StaticMapResponse(code: 0);
}