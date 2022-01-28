import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/data/sourceImpl/task_source_impl.dart';
import 'package:clean_architecture/views/domain/contract/task_contract.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:dartz/dartz.dart';

class TaskContractImpl implements TaskContract {
  final TaskSourceContractImpl _taskSourceContractImpl;

  TaskContractImpl(this._taskSourceContractImpl);

  @override
  Future<Either<Failure, TaskResponse>> createTask(TaskEntity entity) async {
    try {
      final _response = await _taskSourceContractImpl.createTask(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskResponse>> deleteTask(TaskEntity entity) async {
    try {
      final _response = await _taskSourceContractImpl.deleteTask(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskResponse>> getAllTask() async {
    try {
      final _response = await _taskSourceContractImpl.getAllTask();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskResponse>> updateTask(TaskEntity entity) async {
    try {
      final _response = await _taskSourceContractImpl.updateTask(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
