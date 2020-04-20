import 'dart:convert';
import 'package:flutter_naver_maps_api/core/exception/direction_too_many_waypoints_exception.dart';
import 'package:flutter_naver_maps_api/core/exception/naver_api_exception.dart';
import 'package:flutter_naver_maps_api/models/enums/optiontype_code.dart';
import 'package:flutter_naver_maps_api/models/location.dart';
import 'package:flutter_naver_maps_api/models/multiple_request_position_format.dart';
import 'package:flutter_naver_maps_api/models/multiple_request_position_format_list.dart';
import 'package:flutter_naver_maps_api/models/request_position_format.dart';
import 'package:flutter_naver_maps_api/requests/directions_request.dart';
import 'package:flutter_naver_maps_api/responses/directions_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import '../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements Client {}

void main() {

  MockHttpClient mockHttpClient;
  var tDirections5Resposne = fixture('directions5.json');
  var tDirections5ResponseFailed = fixture('directions5_fail.json');
  var tUtf8Header = {
    "content-type": "application/json; charset=utf-8",
  };
  var mockNaverHeader = {
    "X-NCP-APIGW-API-KEY-ID": null,
    "X-NCP-APIGW-API-KEY": null
  };

  setUp(() {
    mockHttpClient = MockHttpClient();
  });
  group('naver directions5 test group: ', () {
    group('http get test: ', () {
      test('should return correct response obj when the call is successful',
      () async {
        ///arrange
        when(mockHttpClient.get(any, headers: mockNaverHeader))
        .thenAnswer((_) async => Response(
          tDirections5Resposne, 
          200,
          headers: tUtf8Header
        ));
        ///act
        var response = await DirectionsRequest(
          start: RequestPositionFormat(
            location: Location(
              lat: 0,
              lng: 0
            )
          ),
          goal: MultipleRequestPositionFormat([
            RequestPositionFormat(location: 
              Location(
                lat: 0,
                lng: 0 
              )
            )
          ]),
          httpClient: mockHttpClient
        ).call();
        var tResponse = DirectionsResponse.fromJson(json.decode(tDirections5Resposne));
        ///assert
        verify(mockHttpClient.get(any, headers: mockNaverHeader));
        expect(tResponse, equals(response));
      });

      test('should return correct response obj when the call is unsuccessful', 
      () async {
        ///arrange
        when(mockHttpClient.get(any, headers: mockNaverHeader))
        .thenAnswer((_) async => Response(
          tDirections5ResponseFailed, 
          200,
          headers: tUtf8Header
        ));
        ///act
        var response = await DirectionsRequest(
          start: RequestPositionFormat(
            location: Location(
              lat: 0,
              lng: 0
            )
          ),
          goal: MultipleRequestPositionFormat([
            RequestPositionFormat(
              location: Location(
                lat: 0,
                lng: 0
              )
            )
          ]),
          httpClient: mockHttpClient
        ).call();
        var tResponse = DirectionsResponse.fromJson(json.decode(tDirections5ResponseFailed));
        ///assert
        verify(mockHttpClient.get(any, headers: mockNaverHeader));
        expect(tResponse, equals(response));
      });

      test('should return Conection Error Exception when the call is abnormal', 
      () async {
        ///arrange
        when(mockHttpClient.get(any, headers: mockNaverHeader))
        .thenAnswer((_) async => Response(
          fixture('naver_error.json'),
          400,
          headers: tUtf8Header
        ));
        var tResponse = DirectionsRequest(
          start: null, 
          goal: null,
          httpClient: mockHttpClient
        );
        try {
          ///action
          await tResponse.call();
        } catch(e){
          ///assert
          expect(e.runtimeType, NaverAPIException);
        }
        verify(mockHttpClient.get(any, headers: mockNaverHeader));
      });
    });

    test('build url test direction5', () {
      ///arrange
      var baseUrl = 'https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?';
      var startQuery = 'start=127.12345,37.12345,sessionid=11223344,name=출발지이름';
      var goalQuery = 'goal=127.12345,37.12345,name=장소이름1:128.12345,38.12345,sessionid=1122334';
      var optionQuery = 'option=trafast';
      var tUrl = '$baseUrl$startQuery&$goalQuery&$optionQuery';
      var urlFromRequest = DirectionsRequest(
          start: RequestPositionFormat(
            location: Location(lat: 127.12345, lng: 37.12345),
            sessionId: '11223344',
            name: '출발지이름'
          ),
          goal: MultipleRequestPositionFormat([
            RequestPositionFormat(
              location: Location(lat: 127.12345, lng: 37.12345),
              name: '장소이름1'
            ),
            RequestPositionFormat(
              location: Location(lat: 128.12345, lng: 38.12345),
              sessionId: '1122334'
            ),
          ]),
          option: [OptionTypeCode.trafast],
          httpClient: mockHttpClient
        ).buildUrl();
      ///assert
      expect(urlFromRequest, equals(tUrl));
    });

    group('get DirectionBaseUrl tests:', () {
      test('should return map-direction url when waypoints is less than 5', () {
        ///arrange
        var baseUrl = 'https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?';
        var tWaypoints = MultipleRequestPositionFormatList([]);
        for(var i=0; i<5;i++){
          tWaypoints.formatList.add(MultipleRequestPositionFormat([]));
        }
        var baseUrlFromRequest = DirectionsRequest(
            start: null,
            goal: null,
            waypoints: tWaypoints,
          ).getDirectionBaseUrl();
        ///assert
        expect(baseUrlFromRequest, equals(baseUrl));
      });

      test('should return map-direction url 5 < when waypoints < 15', () {
        ///arrange
        var baseUrl = 'https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?';
        var tWaypoints = MultipleRequestPositionFormatList([]);
        for(var i=0; i<15;i++){
          tWaypoints.formatList.add(MultipleRequestPositionFormat([]));
        }
        var baseUrlFromRequest = DirectionsRequest(
            start: null,
            goal: null,
            waypoints: tWaypoints,
          ).getDirectionBaseUrl();
        ///assert
        expect(baseUrlFromRequest, equals(baseUrl));
      });

      test('should throw naver api exception when waypoints is > 15', () {
        ///arrange
        var tWaypoints = MultipleRequestPositionFormatList([]);
        for(var i=0; i<16;i++){
          tWaypoints.formatList.add(MultipleRequestPositionFormat([]));
        }
        try {
          DirectionsRequest(
            start:null,
            goal: null,
            waypoints: tWaypoints,
          ).getDirectionBaseUrl();
        } catch(e){
          ///assert
          expect(e.runtimeType, equals(TooManyWaypointsException));
        }
      });
    });
  });

  group('model test group: ', () {
    test('request position format test', () {
      ///arrange
      var tLocation = Location(lat: 12.01, lng: 33.92);
      var tName = 'hkust';
      var tSessionId = '123';
      var tString = '12.01,33.92';
      var tStringWithName = '12.01,33.92,name=hkust';
      var tStringWithSessionId = '12.01,33.92,sessionid=123';
      var tStringWithNameAndSessionId = '12.01,33.92,sessionid=123,name=hkust';
      ///act
      var tRequestPositionFormatString = RequestPositionFormat(location: tLocation).toString();
      var tRequestPositionFormatWithNameString = RequestPositionFormat(location: tLocation, name: tName).toString();
      var tRequestPositionFormatWithSessionIdString = RequestPositionFormat(location: tLocation, sessionId: tSessionId).toString();
      var tRequestPositionFormatWithNameAndSessionIdString = RequestPositionFormat(location: tLocation, name: tName, sessionId: tSessionId).toString();
      
      ///assert
      expect(tString, equals(tRequestPositionFormatString));
      expect(tStringWithName, equals(tRequestPositionFormatWithNameString));
      expect(tStringWithSessionId, equals(tRequestPositionFormatWithSessionIdString));
      expect(tStringWithNameAndSessionId, equals(tRequestPositionFormatWithNameAndSessionIdString));
    });

    test('multiple request position format test', () {
      ///arrange
      var tLocation = Location(lat: 12.01, lng: 33.92);
      var tName = 'hkust';
      var tSessionId = '123';
      var tString = '12.01,33.92,sessionid=123:12.01,33.92,name=hkust';
      ///act
      var testMulti = MultipleRequestPositionFormat([
        RequestPositionFormat(location: tLocation, sessionId: tSessionId), 
        RequestPositionFormat(location: tLocation, name: tName)
      ]).toString();
      expect(tString, equals(testMulti));
    });

    test('multiple request position format list test', () {
      ///arrange
      var tLocation = Location(lat: 12.01, lng: 33.92);
      var tName = 'hkust';
      var tSessionId = '123';
      var tString = '12.01,33.92,sessionid=123:12.01,33.92,name=hkust|12.01,33.92:12.01,33.92';
      ///act
      var testMulti1 = MultipleRequestPositionFormat([
        RequestPositionFormat(location: tLocation, sessionId: tSessionId), 
        RequestPositionFormat(location: tLocation, name: tName)
      ]);
      var testMulti2 = MultipleRequestPositionFormat([
        RequestPositionFormat(location: tLocation), 
        RequestPositionFormat(location: tLocation)
      ]);
      var testMultiList = MultipleRequestPositionFormatList([testMulti1, testMulti2]).toString();
      expect(tString, equals(testMultiList));
    });
  });
}