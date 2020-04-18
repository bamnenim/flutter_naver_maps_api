import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';
import 'package:flutter_naver_maps_api/models/multiple_request_position_format.dart';

class MultipleRequestPositionFormatList extends Model with EquatableMixin {
  final List<MultipleRequestPositionFormat> formatList;
  MultipleRequestPositionFormatList(this.formatList);

  @override
  String toString() => formatList.map((formats)=>formats.toString()).toList().join('|');

  @override
  List<Object> get props => [formatList];

  @override
  Map<String, dynamic> toJson() => {
    "format_list": formatList
  };
  
}