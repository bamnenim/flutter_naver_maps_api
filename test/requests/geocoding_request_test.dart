import 'package:flutter_naver_maps_api/models/result_code.dart';
import 'package:flutter_naver_maps_api/requests/geocoding_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements Client{}

void main(){
  
  var tUrl = '';
  MockHttpClient mockHttpClient;

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
        expect(ResultCode(0), equals(response.code));
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
        var response = GeocodingRequest(query: '');
      ///act
      var url = response.buildUrl();
      ///assert
      verify(response.buildUrl());
      expect(tUrl, equals(url));
    });
  });
}