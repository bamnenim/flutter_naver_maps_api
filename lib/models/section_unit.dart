import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/congestion_code.dart';
import 'package:flutter_naver_maps_api/models/model.dart';

class SectionUnit extends Model with EquatableMixin {

  final int pointIndex;
  final int pointCount;
  final int distance;
  final String name;
  final int congestion;
  final int speed;

  SectionUnit({
    this.pointIndex, 
    this.pointCount, 
    this.distance, 
    this.name, 
    this.congestion, 
    this.speed
  });
  
  factory SectionUnit.fromJson(Map map) => 
    SectionUnit(
      pointIndex: map['pointIndex'],
      pointCount: map['pointCount'],
      distance: map['distance'],
      name: map['name'],
      congestion: map['congestion'],
      speed: map['speed']
    );

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['pointIndex'] = pointIndex;
    map['pointCount'] = pointCount;
    map['distance'] = distance;
    map['name'] = name;
    map['congestion'] = congestion;
    map['speed'] = speed;
    return map;
  }

  @override
  List<Object> get props => [pointIndex, pointCount, distance, name, congestion, speed];
  
}