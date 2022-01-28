import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data extends Equatable {
  final List<Task>? task;
  final int? nbHits;

  const Data({this.task, this.nbHits});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [task, nbHits];
}
