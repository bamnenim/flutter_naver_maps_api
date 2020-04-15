import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:flutter_naver_maps_api/models/route_unit_ent.dart';
import 'package:meta/meta.dart';

class Route extends Model with EquatableMixin {

  final List<RouteUnitEnt> trafast;
  final List<RouteUnitEnt> tracomfort;
  final List<RouteUnitEnt> traoptimal;
  final List<RouteUnitEnt> traavoidtoll;
  final List<RouteUnitEnt> traavoidcaronly;

  Route({
    @required this.trafast,
    @required this.tracomfort,
    @required this.traoptimal,
    @required this.traavoidtoll,
    @required this.traavoidcaronly,
  });

  factory Route.fromJson(Map map) =>
    Route(
      traavoidcaronly: map['traavoidcaronly'] != null ? map['traavoidcaronly']
        ?.map((p) => RouteUnitEnt.fromJson(p))
        ?.toList()
        ?.cast<RouteUnitEnt>() : null,
      trafast: map['trafast'] != null ? map['trafast']
        ?.map((p) => RouteUnitEnt.fromJson(p))
        ?.toList()
        ?.cast<RouteUnitEnt>() : null,
      tracomfort: map['tracomfort'] != null ? map['tracomfort']
        ?.map((p) => RouteUnitEnt.fromJson(p))
        ?.toList()
        ?.cast<RouteUnitEnt>() : null,
      traoptimal: map['traoptimal'] != null ? map['traoptimal']
        ?.map((p) => RouteUnitEnt.fromJson(p))
        ?.toList()
        ?.cast<RouteUnitEnt>() : null,
      traavoidtoll: map['traavoidtoll'] != null ? map['traavoidtoll']
        ?.map((p) => RouteUnitEnt.fromJson(p))
        ?.toList()
        ?.cast<RouteUnitEnt>() : null
    );

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['trafast'] = trafast;
    map['tracomfort'] = tracomfort;
    map['traoptimal'] = traoptimal;
    map['traavoidtoll'] = traavoidtoll;
    map['traavoidcaronly'] = traavoidcaronly;
    return map;
  }

  @override
  List<Object> get props => [trafast, tracomfort, traoptimal, traavoidtoll, traavoidcaronly];
}