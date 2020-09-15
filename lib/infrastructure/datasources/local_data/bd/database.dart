import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:hai_praia/domain/core/logger.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class Database {
  final HiveInterface hive;

  Database({
    @required this.hive,
  });

  static Future init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    return Hive.initFlutter(appDocumentDir.path);
  }

  /// Añade un objeto [Map<String, dynamic] a la base de datos local. Si
  /// el argumento [deleteOldItems] es  [true] eliminará los registros
  /// antiguos dejando un número de registros igual al valor del argumento
  /// [limitOfItems]
  Future<Option<Map<String, dynamic>>> addToDatabaseAndDeleteOld({
    @required String boxName,
    @required Map<String, dynamic> map,
    bool deleteOldItems = false,
    int limitOfItems = 1,
  }) async {
    try {
      final box = await hive.openBox<Map<String, dynamic>>(boxName);
      final key = _keyTimeStamp();
      await box.put(key, map);
      if (deleteOldItems) _deleteOldItems(box, key, limitOfItems);
      await box.close();
      return none();
    } on Exception catch (e) {
      return some(_exceptionMap(e.toString()));
    }
  }

  /// Retorna un elemento de la base datos. Por defecto devuelve el último valor
  /// introducido en la base de datos.
  ///
  /// Si se introduce un argumento [key], retornará el valor correspondiente
  /// a esa clave.
  Future<Map<String, dynamic>> getFromDatabase({
    @required String boxName,
    int key,
  }) async {
    try {
      final box = await hive.openBox<Map<String, dynamic>>(boxName);
      final Map<String, dynamic> map = _getMapFromBox(key, box);
      await box.close();
      return map;
    } on Exception catch (e) {
      return _exceptionMap(e.toString());
    }
  }

  Future<bool> isDatabaseEmpty({@required String boxName}) async {
    final box = await _openBox(boxName);
    return box.isEmpty;
  }

  Future<Box> _openBox(String boxName) async {
    try {
      return hive.openBox(boxName);
    } catch (e) {
      throw Exception();
    }
  }

  Map<String, dynamic> _getMapFromBox(
    int key,
    Box<Map<String, dynamic>> box,
  ) {
    if (box.isEmpty) {
      return _exceptionMap(
        EnumToString.parseCamelCase(DatabaseError.emptyBox),
      );
    }
    final lastIndex = box.length - 1;
    final map = key == null
        ? box.getAt(lastIndex)
        : box.get(
            key,
            defaultValue: _exceptionMap(
              EnumToString.parseCamelCase(DatabaseError.invalidKey),
            ),
          );
    return map;
  }

  Future<Option<Map<String, dynamic>>> _deleteOldItems(
    Box box,
    int key,
    int limitOfItems,
  ) async {
    try {
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
      return none();
    } on Exception catch (e) {
      return some(_exceptionMap(e.toString()));
    }
  }

  Map<String, dynamic> _exceptionMap(String message) =>
      {'status': -1, 'message': message};

  int _keyTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}

enum DatabaseError {
  invalidKey,
  emptyBox,
}
