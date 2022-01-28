import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'task_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskResponse extends TaskEntity {
  final bool? status;
  final String? msg;
  final Data? data;

  TaskResponse({this.status, this.msg, this.data});

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return _$TaskResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);

  @override
  List<Object?> get props => [status, msg, data];
}
