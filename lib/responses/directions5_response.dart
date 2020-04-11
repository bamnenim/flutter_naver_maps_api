import 'package:flutter_naver_maps_api/responses/naver_response.dart';

class Directions5Response extends NaverResponse{
  final String status;

  Directions5Response(this.status) : super(status: status);

  factory Directions5Response.fromJson(String json) => 
    Directions5Response('OK');
  
}