import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/coordiate.dart';
import 'package:flutter_naver_maps_api/models/guide_unit_for_ent.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:flutter_naver_maps_api/models/section_unit.dart';
import 'package:flutter_naver_maps_api/models/summary.dart';
import 'package:meta/meta.dart';

class RouteUnitEnt extends Model with EquatableMixin{

  final Summary summary;
  final List<Coordinate> path;
  final List<SectionUnit> section;
  final List<GuideUnitForEnt> guide;

  RouteUnitEnt({
    @required this.summary, 
    @required this.path,
    this.section,
    this.guide
  });

  factory RouteUnitEnt.fromJson(Map map) =>
    RouteUnitEnt(
      summary: Summary.fromJson(map['summary']), 
      path: map['path']?.map((path)=>Coordinate.fromList(path))
        ?.toList()
        ?.cast<Coordinate>(),
      section: map['section']
        ?.map((section)=> SectionUnit.fromJson(section))
        ?.toList()
        ?.cast<SectionUnit>(),
      guide: map['guide']
        ?.map((guide)=> GuideUnitForEnt.fromJson(guide))
        ?.toList()
        ?.cast<GuideUnitForEnt>()
    );

  @override
  Map<String, dynamic> toJson() {
    return null;
  }

  @override
  List<Object> get props => [summary, path];
}