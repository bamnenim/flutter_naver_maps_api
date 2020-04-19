import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/responses/naver_response.dart';
import 'package:http/http.dart';

class NaverErrorResponse extends NaverResponse with EquatableMixin{
  final int httpStatusCode;
  final int errorCode;
  final String message;
  final String details;

  NaverErrorResponse({
    this.httpStatusCode,
    this.errorCode, 
    this.message, 
    this.details
  });

  factory NaverErrorResponse.fromResponse(Response response) {
    var error = json.decode(response.body)['error'];
    return NaverErrorResponse(
      httpStatusCode: response.statusCode,
      errorCode: error['errorCode'],
      message: error['message'],
      details: error['details']
    );
  }

  factory NaverErrorResponse.fromJson(Map json){
    var error = json['error'];
    return NaverErrorResponse(
      details: error['details'],
      errorCode: error['errorCode'],
      message: error['message']
    );
  }

  @override
  String toString() {
    return 'Http Status: $httpStatusCode, error Code: $errorCode, message: $message, details: $details';
  }

  @override
  List<Object> get props => [httpStatusCode, errorCode];
}