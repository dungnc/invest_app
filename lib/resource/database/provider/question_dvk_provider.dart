import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionDVKProvider extends BaseDBProvider<TableQuestionDVK> {
  static final QuestionDVKProvider _singleton = QuestionDVKProvider._internal();

  factory QuestionDVKProvider() {
    return _singleton;
  }

  Database? db;

  QuestionDVKProvider._internal();
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
      ids.add(await db!.insert(tableQuestionDVK, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionDVK
      (
        $questionDVKId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionDVKNam INTEGER,
        $questionDVKThang INTEGER,
        $questionDVKIDDonVi TEXT,
        $questionDVKMaTinh TEXT,
        $questionDVKMaHuyen TEXT,
        $questionDVKMaXa TEXT,
        $questionDVKMaDiaBan TEXT,
        $questionDVKMaDonVi INTEGER,
        $questionDVKMaTinhTrangHD INTEGER,
        $questionDVKC11 REAL,
        $questionDVKC12 REAL,
        $questionDVKC5 TEXT,
        $questionDVKC5GhiRo TEXT,
        $questionDVKMaDTV TEXT,
        $questionDVKKinhDo REAL,
        $questionDVKViDo REAL,
        $questionDVKNguoiTraLoi TEXT,
        $questionDVKSoDienThoai TEXT,
        $questionDVKThoiGianBD TEXT,
        $questionDVKThoiGianKT TEXT,
        $questionDVKCreatedAt TEXT,
        $questionDVKUpdatedAt TEXT
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
  Future update(TableQuestionDVK value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionDVK, where: '''
        $questionDVKIDDonVi = "$iDDV" 
      AND $questionDVKCreatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionDVKProductUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionDVK, values,
        where: '$questionDVKId = ?', whereArgs: [columId]);
  }
}
