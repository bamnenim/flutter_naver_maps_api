import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:meta/meta.dart';

class Coordinate extends Model with EquatableMixin{
  final double lat;
  final double lng;

  Coordinate({@required this.lat, @required this.lng});

  factory Coordinate.fromList(List<dynamic> list) {
    if(list.length != 2){
      //should thorow list not coordinate exception
    }
    return Coordinate(lat: list[0], lng: list[1]);
  }

  @override
  List<Object> get props => [lat, lng];

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['lat'] = lat;
    map['lng'] = lng;
    return null;
  }

  List<double> toList() => [lat, lng];
}