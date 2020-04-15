import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class Directions15Response extends NaverResponse{
  final ResultCode code;

  Directions15Response({
    this.code,
  }) : super(code: code);

  factory Directions15Response.fromJson(Map json) =>
    null;
}