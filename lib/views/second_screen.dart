import 'package:clean_architecture/views/widgets/form_field.dart';
import 'package:flutter/material.dart';

import 'widgets/bg_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      appBarTitle: 'Add Task',
      bodyWidget: ListView(
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
