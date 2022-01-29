// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'dart:async';

import 'package:clean_architecture/core/database/hive_database.dart';
import 'package:clean_architecture/core/helper/configs/instances.dart';
import 'package:clean_architecture/views/data/model/tasks/task.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

TaskDao? taskDao;

class TaskDao {
  Box<Map>? _tempB;

  Box<Map>? get box => _tempB;

  TaskDao() {
    openBox().then(
      (value) => _tempB = value,
    );
  }

  Future<Box<Map>> openBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.task);
  }

  Future<void> saveTasks(List<Task> data) async {
 
    final map = Map<String, Map>.fromIterable(
      data,
      key: (g) => (g as Task).id.toString(),
      value: (g) => (g as Task).toJson()
    );

    await _tempB!.putAll(map);
  }

  List<Task> convert(Box box) {
    Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    return raw.values.map((e) => Task.fromJson(e)).toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openBox();

    return keys == null ? _tempB?.listenable() : _tempB?.listenable(keys: keys);
  }

  Future clear() async => await _tempB?.clear();
}
