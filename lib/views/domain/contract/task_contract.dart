import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TaskContract {
  Future<Either<Failure, TaskResponse>> createTask(TaskEntity entity);
  Future<Either<Failure, TaskResponse>> updateTask(TaskEntity entity);
  Future<Either<Failure, TaskResponse>> deleteTask(TaskEntity taskID);
  Future<Either<Failure, TaskResponse>> getAllTask();
}
