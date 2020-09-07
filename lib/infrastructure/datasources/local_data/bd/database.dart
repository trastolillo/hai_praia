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

  /// Añade un objeto [Map<String, dynamic] a la base de datos local. Si
  /// el argumento [deleteOldItems] es  [true] eliminará los registros
  /// antiguos dejando un número de registros igual al valor del argumento
  /// [limitOfItems]
  Future<void> addToDatabaseAndDeleteOld({
    @required String boxName,
    @required Map<String, dynamic> map,
    bool deleteOldItems = false,
    int limitOfItems = 1,
  }) async {
    final box = await Hive.openBox<Map<String, dynamic>>(boxName);
    final key = _keyTimeStamp();
    await box.put(key, map);
    if (deleteOldItems) _deleteOldItems(box, key, limitOfItems);
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

  Future<void> _deleteOldItems(Box box, int key, int limitOfItems) async {
    var isDeleted = false;
    for (final oldKey in box.keys) {
      while (box.length > limitOfItems) {
        if (oldKey is int && oldKey < key) {
          await box.delete(oldKey);
          isDeleted = true;
        }
      }
    }
    if (isDeleted) await box.compact();
  }

  Future<bool> isDatabaseEmpty({@required String boxName}) async {
    final box = await Hive.openBox(boxName);
    return box.isEmpty;
  }

  int _keyTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
