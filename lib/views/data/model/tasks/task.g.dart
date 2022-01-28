// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      createdTime: json['createdTime'] as String?,
      endedTime: json['endedTime'] as String?,
      v: json['__v'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'createdTime': instance.createdTime,
      'endedTime': instance.endedTime,
      '__v': instance.v,
      'description': instance.description,
    };
