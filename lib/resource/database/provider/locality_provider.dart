import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/resource/resource.dart';

class LocalityProvider extends BaseDBProvider<TableLocality> {
  static final LocalityProvider _singleton = LocalityProvider._internal();

  factory LocalityProvider() {
    return _singleton;
  }

  Database? db;

  LocalityProvider._internal();

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
  Future<List<int>> insert(List<Map<String, Object?>> value, String createdAt) async {
    List<int> ids = [];
    for (Map<String, Object?> map in value) {
      ids.add(await db!.insert(tableLocality, map));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableLocality
      (
        $localityId INTEGER PRIMARY KEY AUTOINCREMENT,
        $localityMaDiaban TEXT,
        $localityTenDiaBan TEXT,
        $localityMaTinh TEXT,
        $localityMaHuyen TEXT,
        $localityMaXa TEXT,
        $localityCreatedAt TEXT,
        $localityUpdatedAt TEXT
      )
    ''');
  }

  @override
  Future<List<Map>> selectAll() async {
    String createdAt = AppPref.dateTimeSaveDB!;
    return await db!.query(tableLocality, where: '''
      $localityCreatedAt = '$createdAt'
    ''');
  }

  @override
  Future<Map> selectOne(int id) {
    // TODO: implement selectOne
    throw UnimplementedError();
  }

  @override
  Future update(value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
