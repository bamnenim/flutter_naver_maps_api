import 'package:equatable/equatable.dart';
import 'package:flutter_naver_maps_api/models/model.dart';

class ResultCode extends Model with EquatableMixin{
  final int code;

  ResultCode(this.code);

  @override
  List<Object> get props => [code];

  @override
  Map<String, dynamic> toJson() {
    return null;
  }
  
}