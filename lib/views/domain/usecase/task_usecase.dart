import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/views/data/contractImpl/taskimpl.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TaskUseCase implements UseCase<TaskEntity, Params> {
  final TaskContractImpl repository;

  TaskUseCase(this.repository);

  @override
  Future<Either<Failure, TaskResponse>> create(Params params) async {
    return await repository.createTask(params.entity!);
  }

  @override
  Future<Either<Failure, TaskResponse>> delete(Params params) async {
    return await repository.deleteTask(params.entity!);
  }

  @override
  Future<Either<Failure, TaskResponse>> read() async {
    return await repository.getAllTask();
  }

  @override
  Future<Either<Failure, TaskResponse>> update(Params params) async {
    return await repository.updateTask(params.entity!);
  }
}

class Params extends Equatable {
  final TaskEntity? entity;

  const Params({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
