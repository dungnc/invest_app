import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database_helper.dart';
import 'package:statistical_survey/resource/database/provider/provider.dart';
import 'package:statistical_survey/resource/database/table/table_data.dart';

class DataProvider extends BaseDBProvider<TableData> {
  static final DataProvider _singleton = DataProvider._internal();

  factory DataProvider() {
    return _singleton;
  }

  Database? db;

  DataProvider._internal();
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
  Future<List<int>> insert(List value, String createdAt) async {
    List<int> ids = [];
    ids.add(await db!.insert(tableData, value[0]));
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
     CREATE TABLE IF NOT EXISTS $tableData
      (
        $dataId INTEGER PRIMARY KEY AUTOINCREMENT,
        $dataData TEXT,
        $dataCreatedAt TEXT,
        $dataUpdatedAt TEXT
        )
    ''');
  }

  @override
  Future<List<Map>> selectAll() {
    // TODO: implement selectAll
    throw UnimplementedError();
  }

  @override
  Future<Map> selectOne(int id) async {
    List<Map> maps = await db!.rawQuery('''
      SELECT * FROM $tableData WHERE $dataId = $id
    ''');
    return maps[0];
  }

  @override
  Future update(TableData value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
