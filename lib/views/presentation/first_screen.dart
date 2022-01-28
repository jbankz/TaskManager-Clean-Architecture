import 'package:clean_architecture/views/widgets/bg_widget.dart';
import 'package:flutter/material.dart';

import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

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
        bodyWidget: ListView());
  }
}
