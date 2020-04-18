import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:flutter_naver_maps_api/models/request_position_format.dart';

class MultipleRequestPositionFormat extends Model with EquatableMixin {

  final List<RequestPositionFormat> formats;

  MultipleRequestPositionFormat(this.formats);

  @override
  List<Object> get props => [formats];

  @override
  Map<String, dynamic> toJson() => {
    "formats": formats
  };

  @override
  String toString() {
    return formats.map((format)=>format.toString()).toList().join(':');
  }
}