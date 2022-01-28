part of 'taskbloc_bloc.dart';

abstract class TaskblocEvent extends Equatable {
  const TaskblocEvent();

  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TaskblocEvent {
  final TaskEntity entity;

  const CreateTaskEvent(this.entity);
}

class UpdateTaskEvent extends TaskblocEvent {
  final TaskEntity entity;

  const UpdateTaskEvent(this.entity);
}

class DeleteTaskEvent extends TaskblocEvent {
  final TaskEntity entity;

  const DeleteTaskEvent(this.entity);
}

class ReadTaskEvent extends TaskblocEvent {
  const ReadTaskEvent();
}
