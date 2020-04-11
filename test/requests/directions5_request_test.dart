import 'package:flutter_naver_maps_api/requests/directions5_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

class MockHttpClient extends Mock implements Client{}

void main() {

  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });
  group('naver directions5 test group: ', () {
    test('request',
    () async {
      ///arrange
      when(mockHttpClient.get(any))
      .thenAnswer((_) async => Response('OK', 200));
      ///act
      var response = await Directions5Request(
        httpClient: mockHttpClient
      ).call();
      ///assert
      verify(mockHttpClient.get(any));
      expect('OK', equals(response.status));
    });
  });
}