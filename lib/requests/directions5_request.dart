import 'dart:convert';
import 'package:flutter_naver_maps_api/core/exception/naver_api_exception.dart';
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
  final List<OptionTypeCode> option;
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

  Future<NaverResponse> call() async {
    var response = await getHttpResponse(buildUrl());
    if(response.statusCode != 200)
      throw NaverAPIException.fromResponse(response);
    return Directions5Response.fromJson(json.decode(response.body));
  }

  @override
  Map<String, dynamic> buildQueryParmas() {
    var map = Map<String, dynamic>();
    map['start'] = start.toString();
    map['goal'] = goal.toString();
    if(waypoints != null)
      map['waypoints'] = waypoints.toString();
    if(option != null)
      map['option'] = option.map((opt)=>opt.toString().split('.').last).toList().join(',');
    if(cartype != null)
      map['cartype'] = cartype;
    if(fueltype != null)
      map['fueltype'] = fueltype;
    if(mileage != null)
      map['mileage'] = mileage;
    if(lang != null)
      map['lang'] = lang;
    return map;
  }

  @override
  String buildUrl() {
    var baseUrl = 'https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?';
    var queryString = buildQueryParamsToUriString(buildQueryParmas());
    return '$baseUrl$queryString';
  }
}