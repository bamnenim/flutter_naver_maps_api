import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements Client{}

void main() {
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  group('naver directions15 test group : ', () {
    group('http get tests:', () {
      test('should return correct response obj when the call is successful', () {
        ///arrange
        
        ///act
        
        ///assert
        
      });

      test('should return correct response obj when the call is unsuccessful', () {
        ///arrange
        
        ///act
        
        ///assert
        
      });
    });

    test('build url test', () {
      ///arrange
      
      ///act
      
      ///assert
      
    });
  });
}