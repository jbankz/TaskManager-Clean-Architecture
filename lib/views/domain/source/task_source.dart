import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';

abstract class TaskSourceContract {
  Future<TaskResponse> createTask(TaskEntity entity);
  Future<TaskResponse> updateTask(TaskEntity entity);
  Future<TaskResponse> deleteTask(TaskEntity taskID);
  Future<TaskResponse> getAllTask();
}
