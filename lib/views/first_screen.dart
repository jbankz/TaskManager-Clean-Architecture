import 'package:clean_architecture/views/second_screen.dart';
import 'package:clean_architecture/views/widgets/bg_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
      bodyWidget: ListView(
        children: const [],
      ),
    );
  }
}
