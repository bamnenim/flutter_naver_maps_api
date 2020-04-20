import 'package:flutter_naver_maps_api/models/coordiate.dart';
import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/requests/geocoding_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements Client{}

void main(){
  
  MockHttpClient mockHttpClient;
  var tGeocodingResponse = fixture('geocoding.json');
  var tGeocodingResponseFailed = fixture('geocoding_fail.json');
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

  group('naver geocoding test group: ', () {
    group('http get tests :', () {
      test('should return geocoding response when the call is successful', 
      () async {
        ///arrange
        when(mockHttpClient.get(any))
        .thenAnswer((_) async => Response('{"status":"OK"}', 200));
        ///act
        var response = await GeocodingRequest(
          httpClient: mockHttpClient, query: null
        ).call();
        ///assert
        verify(mockHttpClient.get(any));
        expect(0, equals(response.code));
      });

      test('should return correct geocoding response when the call is unsuccessful', () {
        ///arrange
        var response = GeocodingRequest(query: '');
        ///act
        var url = response.buildUrl();
        ///assert
        
      });
    });

    test('build url test', () {
      ///arrange
      var response = GeocodingRequest(
        query: '분당구 불정로 6',
        coordinate: Coordinate(lat: 127.1054328, lng: 37.3595963)
      );
      var tUrl = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=분당구 불정로 6&coordinate=127.1054328,37.3595963';
      ///act
      var url = response.buildUrl();
      ///assert
      expect(tUrl, equals(url));
    });
  });
}