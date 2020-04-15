import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/route.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:meta/meta.dart';

class Directions5Response extends NaverResponse with EquatableMixin{
  final int code;
  final String message;
  final String currentDateTime;
  final Route route;


  Directions5Response({
    @required this.code,
    @required this.message,
    @required this.currentDateTime,
    @required this.route,
  }) : super(code: code);

  factory Directions5Response.fromJson(Map map) => 
    Directions5Response(
      code: map['code'],
      message: map['message'],
      currentDateTime: map['currentDateTime'],
      route: Route.fromJson(map['route']),
    );

  @override
  List<Object> get props => [code, message, currentDateTime, route];
}