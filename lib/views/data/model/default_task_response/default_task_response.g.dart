// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultTaskResponse _$DefaultTaskResponseFromJson(Map<String, dynamic> json) =>
    DefaultTaskResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DefaultTaskResponseToJson(
        DefaultTaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'task': instance.task,
    };
