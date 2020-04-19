import 'dart:convert';
import 'package:flutter_naver_maps_api/models/coordiate.dart';
import 'package:meta/meta.dart';
import 'package:flutter_naver_maps_api/requests/naver_request.dart';
import 'package:flutter_naver_maps_api/responses/geocoding_response.dart';
import 'package:http/http.dart';

final String geoCodingUrl = 'ttps://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode';
class GeocodingRequest extends NaverRequest{
  final String query;
  final Coordinate coordinate;
  final String filter;
  final num page;
  final num count;
  Client httpClient;

  GeocodingRequest({
    @required this.query, 
    this.coordinate, 
    this.filter, 
    this.page, 
    this.count,
    this.httpClient
  }) : super(httpClient: httpClient);

  @override
  Future<GeocodingResponse> call() async =>
    GeocodingResponse.fromJson(json.decode((await httpClient.get('')).body));

  @override
  String buildUrl() {
    // TODO: implement buildUrl
    return null;
  }

  @override
  Map<String, dynamic> buildQueryParmas() {
    var params = Map<String, dynamic>();
    params["query"] = query;
    if(coordinate != null)
      params["coordinate"] = coordinate;
    if(filter != null)
      params["filter"] = filter;
    if(page != null)
      params["page"] = page;
    if(count != null)
      params["count"] = count;
    return params;
  }
}