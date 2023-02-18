import 'dart:convert';

import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:darurat/utils/global_function.dart';
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
${EmergencyContactField.type} $textType
)
''');

    await db.execute('''
CREATE TABLE ${Constant.userEmergencyContact} (
${EmergencyContactField.id} $idType,
${EmergencyContactField.name} $textType,
${EmergencyContactField.number} $textType,
${EmergencyContactField.type} $textType
)
''');

    final String _loadJson = await GlobalFunction.loadJsonData(Constant.daruratJsonPath);
    final _jsonDecode = json.decode(_loadJson);

    try {
      for (var data in _jsonDecode['data']) {
        EmergencyContact _emergencyContact = EmergencyContact.fromJson(data);
        await db.insert(Constant.emergencyContact, _emergencyContact.toJson());
      }
    } catch (e) {
      print(e);
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
