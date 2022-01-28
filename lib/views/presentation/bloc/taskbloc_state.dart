part of 'taskbloc_bloc.dart';

abstract class TaskblocState extends Equatable {
  const TaskblocState();

  @override
  List<Object> get props => [];
}

class TaskblocInitial extends TaskblocState {}

class TaskLoading extends TaskblocState {}

class TaskSuccess extends TaskblocState {
  dynamic response;
  TaskSuccess({required this.response});
}

class TaskFailed extends TaskblocState {
  String? message;
  TaskFailed({required this.message});
}
