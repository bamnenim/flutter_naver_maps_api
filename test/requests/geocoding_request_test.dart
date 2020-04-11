import 'package:flutter_naver_maps_api/requests/geocoding_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'directions5_request_test.dart';

class MocHttpClient extends Mock implements Client{}

void main(){
  MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  group('naver geocoding test group: ', () {
    test('request test', 
    () async {
      ///arrange
      when(mockHttpClient.get(any))
      .thenAnswer((_) async => Response('OK', 200));
      ///act
      var response = await GeocodingRequest(
        httpClient: mockHttpClient
      ).call();
      ///assert
      verify(mockHttpClient.get(any));
      expect('OK', equals(response.status));
    });
  });
}