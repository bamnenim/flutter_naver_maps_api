import 'dart:convert';
import 'package:flutter_naver_maps_api/models/multiple_request_position_format.dart';
import 'package:flutter_naver_maps_api/models/multiple_request_position_format_list.dart';
import 'package:flutter_naver_maps_api/models/request_position_format.dart';
import 'package:meta/meta.dart';
import 'package:flutter_naver_maps_api/models/enums/fueltype_code.dart';
import 'package:flutter_naver_maps_api/models/enums/language_code.dart';
import 'package:flutter_naver_maps_api/models/enums/optiontype_code.dart';
import 'package:flutter_naver_maps_api/requests/naver_request.dart';
import 'package:flutter_naver_maps_api/responses/directions5_response.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:http/http.dart';

class Directions5Request extends NaverRequest{
  final RequestPositionFormat start;
  final MultipleRequestPositionFormat goal;
  final MultipleRequestPositionFormatList waypoints;
  final OptionTypeCode option;
  final int cartype;
  final FuelTypeCode fueltype;
  final double mileage;
  final LanguageCode lang;
  Client httpClient;
  
  Directions5Request({
    @required this.start, 
    @required this.goal, 
    this.waypoints, 
    this.option, 
    this.cartype, 
    this.fueltype, 
    this.mileage, 
    this.lang, 
    this.httpClient,
  }) : super(httpClient: httpClient);

  Future<NaverResponse> call() async => 
    Directions5Response.fromJson(json.decode((await getHttpResponse('')).body));

  @override
  Map<String, dynamic> buildQueryParmas() {
    // TODO: implement buildQueryParmas
    return null;
  }

  @override
  String buildUrl() {
    // TODO: implement buildUrl
    return null;
  }
}