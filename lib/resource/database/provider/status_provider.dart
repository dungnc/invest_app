import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database_helper.dart';
import 'package:statistical_survey/resource/database/provider/provider.dart';
import 'package:statistical_survey/resource/database/table/table_status.dart';

class StatusProvider extends BaseDBProvider<TableStatus> {
  static final StatusProvider _singleton = StatusProvider._internal();

  factory StatusProvider() {
    return _singleton;
  }

  Database? db;

  StatusProvider._internal();
  @override
  Future delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future init() async {
    db = await DatabaseHelper.instance.database;
  }

  @override
  Future<List<int>> insert(List value, String createdAt) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableStatus
      (
        $statusId INTEGER PRIMARY KEY AUTOINCREMENT,
        $statusMaTrangThaiDT INTEGER,
        $statusTenTrangThaiDT TEXT,
        $statusCreatedAt TEXT,
        $statusUpdatedAt TEXT
      )
    ''');
  }

  @override
  Future<List<Map>> selectAll() {
    // TODO: implement selectAll
    throw UnimplementedError();
  }

  @override
  Future<Map> selectOne(int id) {
    // TODO: implement selectOne
    throw UnimplementedError();
  }

  @override
  Future update(TableStatus value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
