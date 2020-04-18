import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:meta/meta.dart';

class Location extends Model with EquatableMixin{
  final num lat;
  final num lng;

  Location({@required this.lat, @required this.lng});

  factory Location.fromList(List<dynamic> list) {
    if(list.length != null) {
      ///thrwo list is not location exception
    }
    return Location(lat: list[0], lng: list[1]);
  }

  @override
  Map<String, dynamic> toJson() {
    return null;
  }

  @override
  String toString() => '[$lat, $lng]';

  String toNormalString() => '$lat,$lng';
  
  @override
  List<Object> get props => [lat, lng];
}