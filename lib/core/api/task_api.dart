import 'package:clean_architecture/core/helper/configs/instances.dart';
import 'package:clean_architecture/core/network/network_service.dart';
import 'package:clean_architecture/core/network/url_config.dart';
import 'package:clean_architecture/views/data/model/default_task_response/default_task_response.dart';
import 'package:clean_architecture/views/data/model/tasks/task_response.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';

class TaskService {
  final NetworkService _networkService;

  TaskService({required NetworkService networkService})
      : _networkService = networkService;

  Future<DefaultTaskResponse> createTask(TaskEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.tasksPath, RequestMethod.post, data: entity.toMap());
      logger.d(_response.data);

      return DefaultTaskResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskResponse> read() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.tasksPath, RequestMethod.get);
      return TaskResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultTaskResponse> updateTask(TaskEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.tasksPath, RequestMethod.post, data: entity.toMap());
      return DefaultTaskResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultTaskResponse> deleteTask(TaskEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.tasksPath, RequestMethod.delete,
          queryParams: entity.toMap2());
      return DefaultTaskResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
