import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EmergencyDatabase {
  EmergencyDatabase._init() {
    debugPrint('EmergencyDatabase created');
  }

  static final EmergencyDatabase _instance = EmergencyDatabase._init();

  static EmergencyDatabase get instance {
    return _instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(Constant.database);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE ${Constant.emergencyContact} (
    ${EmergencyContactField.id} $idType,
    ${EmergencyContactField.name} $textType,
    ${EmergencyContactField.number} $textType,
    ${EmergencyContactField.type} $textType,
    ${EmergencyContactField.createdTime} $textType,
    ${EmergencyContactField.updatedTime} $textType,
    )
    ''');

    await db.execute('''
    CREATE TABLE ${Constant.userEmergencyContact} (
    ${EmergencyContactField.id} $idType,
    ${EmergencyContactField.name} $textType,
    ${EmergencyContactField.number} $textType,
    ${EmergencyContactField.type} $textType,
    ${EmergencyContactField.createdTime} $textType,
    ${EmergencyContactField.updatedTime} $textType,
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
