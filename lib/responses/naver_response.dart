import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:meta/meta.dart';

abstract class NaverResponse{
  final int code;
  NaverResponse({
    @required this.code
  });
}