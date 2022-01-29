import 'package:clean_architecture/core/enums/viewstate.dart';
import 'package:clean_architecture/views/data/dao/task_dao.dart';
import 'package:clean_architecture/views/data/model/tasks/task.dart';
import 'package:clean_architecture/views/presentation/provider/task_provider.dart';
import 'package:clean_architecture/views/widgets/bg_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TaskProvider? _provider;
  @override
  void initState() {
    super.initState();
    _provider = Provider.of<TaskProvider>(context, listen: false);
    _provider!.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        appBarTitle: 'Tasks',
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen())),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bodyWidget: Consumer<TaskProvider>(
          builder: (context, provider, child) {
            return FutureBuilder(
              future: taskDao!.getListenable(),
              builder: (BuildContext context,
                  AsyncSnapshot<ValueListenable<Box>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const Center(child: Text('Loading....'));
                }

                if (snapshot.hasError) {}

                return ValueListenableBuilder(
                  valueListenable: snapshot.data!,
                  builder:
                      (BuildContext context, Box<dynamic> value, Widget? child) {
                    List<Task>? _task = taskDao!.convert(value).toList();

                    if (provider.state == ViewState.busy) {
                      return const CircularProgressIndicator();
                    }

                    if (_task.isEmpty) {
                      return const Center(child: Text('DB is empty'));
                    }

                    return ListView(
                      children: [
                        ..._task
                            .map((element) => ListTile(
                                  onTap: () {
                                    _provider!.setData(element);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddTaskScreen()));
                                  },
                                  title: Text(element.title ?? ''),
                                  subtitle: Text(element.description ?? ''),
                                ))
                            .toList()
                      ],
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
