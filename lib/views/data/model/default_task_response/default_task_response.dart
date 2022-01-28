import 'package:clean_architecture/views/data/model/tasks/task.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'default_task_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DefaultTaskResponse extends TaskResponse {
  bool? status;
  String? msg;
  Task? task;

  DefaultTaskResponse({this.status, this.msg, this.task});

  factory DefaultTaskResponse.fromJson(Map<String, dynamic> json) {
    return _$DefaultTaskResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultTaskResponseToJson(this);
}
