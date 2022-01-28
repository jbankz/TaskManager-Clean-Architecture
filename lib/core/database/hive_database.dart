import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/helper/configs/instances.dart';

class HiveManager {
  HiveManager._internal();

  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() => _instance;

  static HiveManager get instance => _instance;

  /// initialize local data storage
  Future<void> initializeDatabase() async {
    await Hive.initFlutter();
    await HiveBoxes.openAllBox();
  }
}

class HiveBoxes {
  static Future openAllBox() async {}

  static Future clearAllBox() async {}

  static Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName);
        box = await Hive.openBox<T>(boxName);
      }
    }

    return box;
  }

  static Future<void> closeBox<T>(String boxName) async {
    Box box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
      box.close();
    }
  }

  static Future<void> clearData() async {
    await _clearBox<Map<String, dynamic>>('');
  }

  static Future<void> _clearBox<T>(String name) async {
    try {
      final Box<T> _box = await openBox<T>(name);
      await _box.clear();
    } catch (_) {
      logger.e('clear $name error: ${_.toString()}');
    }
  }

  static logOut(BuildContext context) async {}
}
