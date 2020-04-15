import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/guide_code.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:meta/meta.dart';

class GuideUnitForEnt extends Model with EquatableMixin{

  final int pointIndex;
  final int type;
  final String instructions;
  final int distance;
  final int duration;

  GuideUnitForEnt({
    @required this.pointIndex, 
    @required this.type, 
    this.instructions, 
    @required this.distance, 
    @required this.duration
  });

  factory GuideUnitForEnt.fromJson(Map map) =>
    GuideUnitForEnt(
      pointIndex: map['pointIndex'], 
      type: map['type'], 
      instructions: map['instruction'],
      distance: map['distance'], 
      duration: map['duration']
    );

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return null;
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
  
}