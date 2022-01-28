import 'package:clean_architecture/core/api/task_api.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:clean_architecture/views/domain/source/task_source.dart';

class TaskSourceContractImpl implements TaskSourceContract {
  final TaskService _taskService;

  TaskSourceContractImpl({required TaskService taskService})
      : _taskService = taskService;

  @override
  Future<TaskResponse> createTask(TaskEntity entity) async {
    return await _taskService.createTask(entity);
  }

  @override
  Future<TaskResponse> deleteTask(TaskEntity entity) async {
    return await _taskService.deleteTask(entity);
  }

  @override
  Future<TaskResponse> getAllTask() async {
    return await _taskService.read();
  }

  @override
  Future<TaskResponse> updateTask(TaskEntity entity) async {
    return await _taskService.updateTask(entity);
  }
}
