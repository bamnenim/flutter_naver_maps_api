import 'dart:convert';

import 'package:http/http.dart';

class NaverAPIException implements Exception{
  final int httpStatusCode;
  final int errorCode;
  final String message;
  final String details;

  NaverAPIException({
    this.httpStatusCode,
    this.errorCode, 
    this.message, 
    this.details
  });

  factory NaverAPIException.fromResponse(Response response) {
    var error = json.decode(response.body)['error'];
    return NaverAPIException(
      httpStatusCode: response.statusCode,
      errorCode: int.parse(error['errorCode']),
      message: error['message'],
      details: error['details']
    );
  }

  @override
  String toString() {
    return 'Http Status: $httpStatusCode, error Code: $errorCode, message: $message, details: $details';
  }
}