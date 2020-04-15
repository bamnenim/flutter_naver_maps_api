import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/location.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:meta/meta.dart';

class ResponsePositionFormat extends Model with EquatableMixin{

  final Location location;
  final int dir;

  ResponsePositionFormat({
    @required this.location, 
    this.dir
  });

  factory ResponsePositionFormat.fromJson(Map map) => 
    ResponsePositionFormat(
      location: Location.fromList(map['location']),
      dir: map['dir']
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