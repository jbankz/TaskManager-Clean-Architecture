import 'package:clean_architecture/core/enums/viewstate.dart';
import 'package:clean_architecture/core/helper/configs/instances.dart';
import 'package:clean_architecture/core/viewmodels/base_model.dart';
import 'package:clean_architecture/views/data/dao/task_dao.dart';
import 'package:clean_architecture/views/data/model/tasks/task.dart';
import 'package:clean_architecture/views/domain/usecase/task_usecase.dart';

class TaskProvider extends BaseModel {
  final TaskUseCase _useCase;
  Task? singleTask;

  TaskProvider(this._useCase);

  void getAllTasks() async {
    try {
      if (taskDao!.box!.isEmpty) {
        setState(ViewState.busy, triggerListener: false);
      }

      final _response = await _useCase.read();
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (r) => taskDao!.saveTasks(r.data?.task ?? []));

      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle, triggerListener: false);
    }
  }

  void setData(Task task) {
    singleTask = task;
    notifyListeners();
  }

  void disposeValue() {
    singleTask = null;
    notifyListeners();
  }
}
