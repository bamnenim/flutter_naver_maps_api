import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_naver_maps_api/models/location.dart';
import 'package:flutter_naver_maps_api/models/model.dart';

class RequestPositionFormat extends Model with EquatableMixin {
  final Location location;
  final String sessionId;
  final String name;

  RequestPositionFormat({
    @required this.location, 
    this.sessionId, 
    this.name
  });

  @override
  List<Object> get props => [location];

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['location'] = location;
    if(sessionId != null)
      map['sessionid'] = sessionId;
    if(name != null)
      map['name'] = name;
    return map;
  }

  @override
  String toString() {
    var requestPositionFormatString = location.toNormalString();
    if(sessionId != null)
      requestPositionFormatString += ',sessionid=$sessionId';
    if(name != null)
      requestPositionFormatString += ',name=$name';
    return requestPositionFormatString;
  }
}