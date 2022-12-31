import 'dart:io';

import 'package:crud_with_sqflite/models/table_mahasiswa.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final String _databaseName = 'mahasiswa.db';
  final int _databseVersion = 1;

  Database? _database;

  TableMahasiswa tableMahasiswa = TableMahasiswa();

  Future<Database> database() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, onCreate: _onCreate, version: _databseVersion);
  }

// create query
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ${tableMahasiswa.tableName} (" +
        "id integer PRIMARY KEY," +
        "nim text null," +
        "nama_lengkap text null," +
        "email text null," +
        "no_hp text null," +
        "created_at text null," +
        "updated_at text null" +
        ")");
  }

  //insert data
  Future<int> inserDataMahasiswa(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableMahasiswa.tableName, row);
    print("Data table : $query");
    return query;
  }

  //get data
  Future<List<TableMahasiswa>> getDataMahasiswa() async {
    final data = await _database!.query(tableMahasiswa.tableName);
    List<TableMahasiswa> result =
        data.map((e) => TableMahasiswa.fromJson(e)).toList();
    print("Data mahasiswa : $result");
    return result;
  }

  //update data
  Future<int> updateDataMahasiswa(int idParam, Map<String, dynamic> row) async {
    final query = await _database!.update(tableMahasiswa.tableName, row,
        where: 'id = ?', whereArgs: [idParam]);
    return query;
  }

  //delete data
  Future<int> deleteData(int idParam) async {
    return await _database!.delete(tableMahasiswa.tableName,
        where: 'id = ?', whereArgs: [idParam]);
  }
}
