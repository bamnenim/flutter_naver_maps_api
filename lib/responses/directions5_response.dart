import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/route.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:meta/meta.dart';

class DirectionsResponse extends NaverResponse with EquatableMixin{
  final int code;
  final String message;
  final String currentDateTime;
  final Route route;


  DirectionsResponse({
    @required this.code,
    @required this.message,
    @required this.currentDateTime,
    @required this.route,
  }) : super(code: code);

  factory DirectionsResponse.fromJson(Map map) => 
    DirectionsResponse(
      code: map['code'],
      message: map['message'],
      currentDateTime: map['currentDateTime'],
      route: map['route'] != null ? Route.fromJson(map['route']) : null,
    );

  @override
  List<Object> get props => [code, message, currentDateTime, route];
}