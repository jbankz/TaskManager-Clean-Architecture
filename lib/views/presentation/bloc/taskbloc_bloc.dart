import 'package:bloc/bloc.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:clean_architecture/views/domain/usecase/task_usecase.dart';
import 'package:equatable/equatable.dart';

part 'taskbloc_event.dart';
part 'taskbloc_state.dart';

class TaskblocBloc extends Bloc<TaskblocEvent, TaskblocState> {
  final TaskUseCase _useCase;

  TaskblocBloc(this._useCase) : super(TaskblocInitial()) {
    on<TaskblocEvent>((event, emit) async {
      if (event is CreateTaskEvent) {
        try {
          emit(TaskLoading());
          final _response = await _useCase.create(Params(entity: event.entity));
          _response.fold((l) => emit(TaskFailed(message: l.errorMessage(l))),
              (r) => emit(TaskSuccess(response: r)));
        } catch (e) {
          emit(TaskFailed(message: e.toString()));
        }
      }
    });
  }
}
