import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/coordiate.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:flutter_naver_maps_api/models/response_position_format.dart';
import 'package:meta/meta.dart';

class Summary extends Model with EquatableMixin {

  final ResponsePositionFormat start;
  final ResponsePositionFormat goal;
  final List<ResponsePositionFormat> waypoints;
  final int distance;
  final int duration;
  final List<Coordinate> bbox;
  final int tolFare;
  final int taxiFare;
  final int fuelPrice;

  Summary({
    @required this.start, 
    @required this.goal, 
    this.waypoints, 
    @required this.distance, 
    @required this.duration, 
    @required this.bbox, 
    @required this.tolFare,
    @required this.taxiFare, 
    @required this.fuelPrice
  });

  factory Summary.fromJson(Map map) =>
    Summary(
      start: ResponsePositionFormat.fromJson(map['start']), 
      goal: ResponsePositionFormat.fromJson(map['goal']),
      waypoints: map['waypoints']
        ?.map((point) => ResponsePositionFormat.fromJson(point))
        ?.toList()
        ?.cast<ResponsePositionFormat>(), 
      distance: map['distance'], 
      duration: map['duration'], 
      bbox: map['bbox']
        ?.map((coordi) => Coordinate.fromList(coordi))
        ?.toList()
        ?.cast<Coordinate>(), 
      tolFare: map['tollFare'], 
      taxiFare: map['taxiFare'], 
      fuelPrice: map['fuelPrice']
    );

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['start'] = start;
    map['goal'] = goal;
    map['waypoints'] = waypoints?.map((point) => point.toJson())?.toList();
    map['distance'] = distance;
    map['duration'] = duration;
    map['bbox'] = bbox?.map((coord) => coord.toList())?.toList();
    map['tolFare'] = tolFare;
    map['taxiFare'] = taxiFare;
    map['fuelPrice'] = fuelPrice;
    return map;
  }

  @override
  List<Object> get props => [start, goal, distance, duration, bbox, tolFare, taxiFare, fuelPrice];
}