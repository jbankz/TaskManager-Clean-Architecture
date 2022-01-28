import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String? title;
  final String? description;
  final String? createdTime;
  final String? endedTime;
  final String? taskID;

  const TaskEntity(
      {this.title,
      this.description,
      this.createdTime,
      this.endedTime,
      this.taskID});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdTime': createdTime,
      'endedTime': endedTime
    };
  }

  Map<String, dynamic> toMap2() {
    return {'id=': taskID};
  }

  @override
  List<Object?> get props => [];
}
