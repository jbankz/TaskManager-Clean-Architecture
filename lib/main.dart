import 'package:flutter/material.dart';

import 'core/di/injector.dart';
import 'core/network/app_config.dart';
import 'views/presentation/first_screen.dart';

void main() async {
  await initializeCore(environment: Environment.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirstScreen(),
    );
  }
}
