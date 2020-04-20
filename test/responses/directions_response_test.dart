import 'dart:convert';
import 'package:flutter_naver_maps_api/models/coordiate.dart';
import 'package:flutter_naver_maps_api/models/guide_unit_for_ent.dart';
import 'package:flutter_naver_maps_api/models/location.dart';
import 'package:flutter_naver_maps_api/models/response_position_format.dart';
import 'package:flutter_naver_maps_api/models/route.dart';
import 'package:flutter_naver_maps_api/models/route_unit_ent.dart';
import 'package:flutter_naver_maps_api/models/section_unit.dart';
import 'package:flutter_naver_maps_api/models/summary.dart';
import 'package:flutter_naver_maps_api/responses/directions_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../fixtures/fixture_reader.dart';

void main() {

  var direction5SuccessResult = json.decode(fixture('directions5.json'));
  var direction5FailedResult = json.decode(fixture('directions5_fail.json'));

  group('directions5 response test group: ', () {
    group('from json test group: ', () {
      test('should return correct response obj when the json is given with successful response', () {
        ///arrange
        var tResponseFromJson = DirectionsResponse.fromJson(direction5SuccessResult);
        var tResponseFromObject = DirectionsResponse(
          code: 0,
          message: "길찾기를 성공하였습니다.",
          currentDateTime: "2018-12-21T14:45:34",
          route: Route(
            trafast: [RouteUnitEnt.fromJson(direction5SuccessResult['route']['trafast'][0])], 
            tracomfort: null, 
            traoptimal: null, 
            traavoidtoll: null, 
            traavoidcaronly: null
          )
        );
        ///assert
        expect(tResponseFromJson, equals(tResponseFromObject));
      });

      test('should return correct response obj when the json is given with unsucessful response', () {
        ///arrange
        var tResponseFromJson = DirectionsResponse.fromJson(direction5FailedResult);
        var tResponseFromObject = DirectionsResponse(
          code: 1,
          message: "출발지와 도착지가 동일합니다. 확인 후 다시 지정해주세요.",
          currentDateTime: null,
          route: null
        );
        ///assert
        expect(tResponseFromJson, equals(tResponseFromObject));
        ///assert
        
      });

      group('models for directions5 response tests: ', () {

        var tRouteFromJson = Route.fromJson(direction5SuccessResult['route']);
        var tRouteUnitEntFromJson = RouteUnitEnt.fromJson(direction5SuccessResult['route']['trafast'][0]);
        var tSummaryFromJson = Summary.fromJson(direction5SuccessResult['route']['trafast'][0]['summary']);
        var tSectionUnitFromJson = SectionUnit.fromJson(direction5SuccessResult['route']['trafast'][0]['section'][0]);
        var tGuideUnitForEntFromJson = GuideUnitForEnt.fromJson(direction5SuccessResult['route']['trafast'][0]['guide'][0]);
        var tResponsePositionFormatFromJson = ResponsePositionFormat.fromJson(direction5SuccessResult['route']['trafast'][0]['summary']['start']);

        test('Route from json test', () {
          ///arrange
          var tRouteFromObject = Route(
            trafast: [tRouteUnitEntFromJson], 
            tracomfort: null, 
            traoptimal: null, 
            traavoidcaronly: null, 
            traavoidtoll: null
          );
          ///assert
          expect(tRouteFromJson, equals(tRouteFromObject));
        });

        test('route unit ent from json test', () {
          ///arrange
          var tRouteUnitEntFromObject = RouteUnitEnt(
            summary: tSummaryFromJson, 
            path: [
                    Coordinate.fromList([
                      127.1059968,
                      37.3597093
                    ]),
                    Coordinate.fromList([
                      129.0764276,
                      35.1795108
                    ]),
                    Coordinate.fromList([
                      129.0762855,
                      35.1793188
                    ])
                ],
          );
          ///assert
          expect(tRouteUnitEntFromJson, equals(tRouteUnitEntFromObject));
        });

        test('summary from json test', () {
          ///arrange
          var tSummaryFromObject = Summary(
            start: ResponsePositionFormat(
              location: Location(lat: 127.1058342, lng: 37.3597078)
            ), 
            goal: ResponsePositionFormat(
              location: Location(lat: 129.0759853, lng: 35.1794697),
              dir: 2
            ), 
            distance: 382403, 
            duration: 15372873, 
            bbox: [
              Coordinate.fromList([127.0833901, 35.1793188]), 
              Coordinate.fromList([129.0817364, 37.3599059])
            ], 
            tolFare: 24500, 
            taxiFare: 319900, 
            fuelPrice: 46027
          );
          ///assert
          expect(tSummaryFromJson, equals(tSummaryFromObject));
        });

        test('section unit from json test', () {
          ///arrange
          var tSectionUnitFromObject = SectionUnit(
            pointCount: 358,
            pointIndex: 654,
            distance: 22495,
            name: '죽양대로',
            congestion: 1,
            speed: 60,
          );
          ///assert
          expect(tSectionUnitFromJson, equals(tSectionUnitFromObject));
        });

        test('guide unit for ent from json test', () {
          ///arrange
          var tGuideUnitForEntFromObject = GuideUnitForEnt(
            pointIndex: 1, 
            type: 3, 
            distance: 21, 
            duration: 4725
          );
          ///assert
          expect(tGuideUnitForEntFromJson, equals(tGuideUnitForEntFromObject));
        });

        test('response postion format from json test', () {
          ///arrange
          var tResponsePositionFormatFromObject = ResponsePositionFormat(
            location: Location.fromList([127.1058342, 37.3597078]));
          ///assert
          expect(tResponsePositionFormatFromJson, equals(tResponsePositionFormatFromObject));
        });
      });
    });
  });
}