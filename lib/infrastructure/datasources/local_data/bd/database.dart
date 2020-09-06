import 'package:flutter/foundation.dart' show required;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class Database {
  static const _defaultValue = {'status': -1};

  static Future init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    return Hive.initFlutter(appDocumentDir.path);
  }

  Future<void> addToDatabase({
    @required String boxName,
    @required Map<String, dynamic> map,
  }) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    final key = _keyTimeStamp();
    await box.put(key, map);
    await _deleteOldItem(box, key);
    await box.close();
  }

  Future<Map<String, dynamic>> getFromDatabase({
    @required String boxName,
    int key,
  }) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    final map = key == null
        ? box.getAt(box.length - 1) ?? _defaultValue
        : box.get(key, defaultValue: _defaultValue);
    await box.close();
    return map;
  }

  Future<void> _deleteOldItem(Box box, int key) async {
    var isDeleted = false;
    for (final oldKey in box.keys) {
      if (oldKey is int && oldKey < key) {
        await box.delete(oldKey);
        isDeleted = true;
      }
    }
    if (isDeleted) await box.compact();
  }

  int _keyTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
