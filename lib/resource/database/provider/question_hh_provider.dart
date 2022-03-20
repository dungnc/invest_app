import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionHHProvider extends BaseDBProvider<TableQuestionHH> {
  static final QuestionHHProvider _singleton = QuestionHHProvider._internal();

  factory QuestionHHProvider() {
    return _singleton;
  }

  Database? db;

  QuestionHHProvider._internal();
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
  Future<List<int>> insert(
      List<Map<String, Object?>> value, String createdAt) async {
    List<int> ids = [];
    for (Map<String, Object?> item in value) {
      ids.add(await db!.insert(tableQuestionHH, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionHH
      (
        $questionHHId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionHHNam INTEGER,
        $questionHHThang INTEGER,
        $questionHHIDDonVi TEXT,
        $questionHHMaTinh TEXT,
        $questionHHMaHuyen TEXT,
        $questionHHMaXa TEXT,
        $questionHHMaDiaBan TEXT,
        $questionHHMaDonVi INTEGER,
        $questionHHMaTinhTrangHD INTEGER,
        $questionHHC11 REAL,
        $questionHHC12 REAL,
        $questionHHC13 REAL,
        $questionHHC4 TEXT,
        $questionHHC4GhiRo TEXT,
        $questionHHMaDTV TEXT,
        $questionHHKinhDo REAL,
        $questionHHViDo REAL,
        $questionHHNguoiTraLoi TEXT,
        $questionHHSoDienThoai TEXT,
        $questionHHThoiGianBD TEXT,
        $questionHHThoiGianKT TEXT,
        $questionHHCreatedAt TEXT,
        $questionHHUpdatedAt TEXT
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
  Future update(TableQuestionHH value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionHH, where: '''
        $questionHHIDDonVi = "$iDDV" 
      AND $questionHHCreatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionHHProductUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionHH, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
