import 'dart:convert';

import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EmergencyDatabase {
  EmergencyDatabase._init();

  static final EmergencyDatabase _instance = EmergencyDatabase._init();

  static EmergencyDatabase get instance {
    return _instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(Constant.database.databaseName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textTypeNotNull = 'TEXT NOT NULL';
    const textTypeNull = 'TEXT NULL';

    await db.execute('''
CREATE TABLE ${Constant.database.emergencyContactTable} (
${EmergencyContactField.id} $idType,
${EmergencyContactField.name} $textTypeNotNull,
${EmergencyContactField.number} $textTypeNotNull,
${EmergencyContactField.type} $textTypeNotNull,
${EmergencyContactField.createdTime} $textTypeNull,
${EmergencyContactField.updatedTime} $textTypeNull
)
''');

    await db.execute('''
CREATE TABLE ${Constant.database.userEmergencyContactTable} (
${EmergencyContactField.id} $idType,
${EmergencyContactField.name} $textTypeNotNull,
${EmergencyContactField.number} $textTypeNotNull,
${EmergencyContactField.type} $textTypeNotNull,
${EmergencyContactField.createdTime} $textTypeNull,
${EmergencyContactField.updatedTime} $textTypeNull
)
''');

    final String _loadJson = await GlobalFunction.loadJsonData(Constant.database.initialJsonData);
    final _jsonDecode = json.decode(_loadJson);

    try {
      for (var data in _jsonDecode['data']) {
        EmergencyContact _emergencyContact = EmergencyContact.fromJson(data);
        Map<String, dynamic> _emergencyJson = _emergencyContact
            .copyWith(
              createdTime: DateTime.now(),
              updatedTime: DateTime.now(),
            )
            .toJson();
        await db.insert(Constant.database.emergencyContactTable, _emergencyJson);
      }
    } catch (e) {
      debugPrint('initialize data $e');
    }
  }

  Future<EmergencyContact> insert(String table, EmergencyContact emergencyContact) async {
    final Database db = await instance.database;
    final int id = await db.insert(table, emergencyContact.toJson());

    return emergencyContact.copyWith(id: id);
  }

  Future<List<EmergencyContact>> getEmergencyContacts(String table) async {
    final Database db = await instance.database;
    final result = await db.query(table);

    return result.map((json) => EmergencyContact.fromJson(json)).toList();
  }

  Future<EmergencyContact> update(String table, EmergencyContact emergencyContact) async {
    final Database db = await instance.database;
    final int id = await db.update(
      table,
      emergencyContact.toJson(),
      where: '${EmergencyContactField.id} = ?',
      whereArgs: [emergencyContact.id],
    );

    return emergencyContact.copyWith(id: id);
  }

  Future<int> delete(String table, int id) async {
    final Database db = await instance.database;
    return await db.delete(
      table,
      where: '${EmergencyContactField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
