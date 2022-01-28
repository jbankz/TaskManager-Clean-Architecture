import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? createdTime;
  final String? endedTime;
  @JsonKey(name: '__v')
  final int? v;
  final String? description;

  const Task({
    this.id,
    this.title,
    this.createdTime,
    this.endedTime,
    this.v,
    this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      createdTime,
      endedTime,
      v,
      description,
    ];
  }
}
