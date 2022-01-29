import 'package:clean_architecture/core/di/injector.dart';
import 'package:clean_architecture/core/viewmodels/base_model.dart';
import 'package:clean_architecture/views/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<BaseModel>(create: (_) => BaseModel()),
    ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider(inject())),
  ];
}
