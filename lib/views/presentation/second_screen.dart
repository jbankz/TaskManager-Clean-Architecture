import 'package:clean_architecture/core/di/injector.dart';
import 'package:clean_architecture/core/helper/configs/instances.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
import 'package:clean_architecture/views/presentation/provider/task_provider.dart';
import 'package:clean_architecture/views/widgets/bg_widget.dart';
import 'package:clean_architecture/views/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/taskbloc_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _bloc = TaskblocBloc(inject());
  late TaskProvider _provider;

  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _fourthController = TextEditingController();

  @override
  void initState() {
    _provider = Provider.of<TaskProvider>(context, listen: false);
    _checkForUpdate();
    super.initState();
  }

  void _checkForUpdate() {
    _firstController =
        TextEditingController(text: _provider.singleTask?.title ?? '');
    _secondController =
        TextEditingController(text: _provider.singleTask?.description ?? '');
    _thirdController =
        TextEditingController(text: _provider.singleTask?.createdTime ?? '');
    _fourthController =
        TextEditingController(text: _provider.singleTask?.endedTime ?? '');
    setState(() {});
  }

  @override
  void dispose() {
    _provider.disposeValue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      appBarTitle: _provider.singleTask != null ? 'Update Task' : 'Add Task',
      bodyWidget: BlocListener<TaskblocBloc, TaskblocState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is TaskLoading) {
            logger.i('Adding Task');
          }
          if (state is TaskFailed) {
            logger.e(state.message ?? '');
          }

          if (state is TaskSuccess) {
            logger.d('Success');
            Provider.of<TaskProvider>(context, listen: false).getAllTasks();
          }
        },
        child: ListView(
          children: [
            Formfields(controller: _firstController, hint: 'Title'),
            const SizedBox(height: 23),
            Formfields(controller: _secondController, hint: 'Description'),
            const SizedBox(height: 23),
            Formfields(controller: _thirdController, hint: 'Starting Period'),
            const SizedBox(height: 23),
            Formfields(controller: _fourthController, hint: 'Ending Period'),
            const SizedBox(height: 23),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                child: Text(
                    _provider.singleTask != null ? 'Update Task' : 'Add Task'),
                onPressed: () => _triggerEvent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _triggerEvent() {
    _bloc.add(CreateTaskEvent(TaskEntity(
      title: _firstController.text,
      description: _secondController.text,
      createdTime: _thirdController.text,
      endedTime: _fourthController.text,
    )));
  }

  _updateEvent() {
    _bloc.add(UpdateTaskEvent(TaskEntity(
      title: _firstController.text,
      description: _secondController.text,
      createdTime: _thirdController.text,
      endedTime: _fourthController.text,
    )));
  }
}
