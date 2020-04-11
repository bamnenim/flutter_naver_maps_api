import 'package:flutter_naver_maps_api/models/location.dart';
import 'package:flutter_naver_maps_api/requests/naver_request.dart';
import 'package:flutter_naver_maps_api/responses/geocoding_response.dart';
import 'package:http/http.dart';

class GeocodingRequest extends NaverRequest{
  final String query;
  final Location coordinate;
  final String filter;
  final num page;
  final num count;
  Client httpClient;

  GeocodingRequest({
    this.query, 
    this.coordinate, 
    this.filter, 
    this.page, 
    this.count,
    this.httpClient
  });

  @override
  Future<GeocodingResponse> call() async {
    return null;
  }

  
}