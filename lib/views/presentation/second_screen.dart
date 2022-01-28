import 'package:clean_architecture/core/di/injector.dart';
import 'package:clean_architecture/core/helper/configs/instances.dart';
import 'package:clean_architecture/views/domain/entity/task_entity.dart';
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

  void _checkForUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      appBarTitle: 'Add Task',
      bodyWidget: BlocListener<TaskblocBloc, TaskblocState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is TaskLoading) {
            logger.i('Adding Task');
          }
          if (state is TaskFailed) {
            logger.e(state.message ?? '');
          }

          if (state is TaskSuccess) {}
        },
        child: ListView(
          children: [
            const Formfields(controller: null, hint: 'Title'),
            const SizedBox(height: 23),
            const Formfields(controller: null, hint: 'Description'),
            const SizedBox(height: 23),
            const Formfields(controller: null, hint: 'Starting Period'),
            const SizedBox(height: 23),
            const Formfields(controller: null, hint: 'Ending Period'),
            const SizedBox(height: 23),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                child: const Text('Add Task'),
                onPressed: () {
                  _bloc.add(const CreateTaskEvent(TaskEntity(
                    title: 'Sample',
                    description: 'Sample',
                    createdTime: 'Sample',
                    endedTime: 'Sample',
                  )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
