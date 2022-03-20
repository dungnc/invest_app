import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionDVLAProvider extends BaseDBProvider<TableQuestionDVLA> {
  static final QuestionDVLAProvider _singleton =
      QuestionDVLAProvider._internal();

  factory QuestionDVLAProvider() {
    return _singleton;
  }

  Database? db;

  QuestionDVLAProvider._internal();
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
      ids.add(await db!.insert(tableQuestionDVLA, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionDVLA
      (
        $questionDVLAId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionDVLANam INTEGER,
        $questionDVLAThang INTEGER,
        $questionDVLAIDDonVi TEXT,
        $questionDVLAMaTinh TEXT,
        $questionDVLAMaHuyen TEXT,
        $questionDVLAMaXa TEXT,
        $questionDVLAMaDiaBan TEXT,
        $questionDVLAMaDonVi INTEGER,
        $questionDVLAMaTinhTrangHD INTEGER,
        $questionDVLAC1_1 REAL,
        $questionDVLAC1_2 REAL,
        $questionDVLAC4_1 INTEGER,
        $questionDVLAC4_2 INTEGER,
        $questionDVLAC4_31 INTEGER,
        $questionDVLAC4_32 INTEGER,
        $questionDVLAC5_1 INTEGER,
        $questionDVLAC5_2 INTEGER,
        $questionDVLAC6_1 INTEGER,
        $questionDVLAC6_2 INTEGER,
        $questionDVLAC7_1 INTEGER,
        $questionDVLAC7_2 INTEGER,
        $questionDVLAC7_31 INTEGER,
        $questionDVLAC7_32 INTEGER,
        $questionDVLAC8_1 INTEGER,
        $questionDVLAC8_2 INTEGER,
        $questionDVLAC9_1 INTEGER,
        $questionDVLAC9_2 INTEGER,
        $questionDVLAC10 INTEGER,
        $questionDVLAC10GhiRo TEXT,
        $questionDVLAMaDTV TEXT,
        $questionDVLAKinhdo REAL,
        $questionDVLAVido REAL,
        $questionDVLANguoiTraLoi TEXT,
        $questionDVLASoDienThoai TEXT,
        $questionDVLAThoiGianBD TEXT,
        $questionDVLAThoiGianKT TEXT,
        $questionDVLACreatedAt TEXT,
        $questionDVLAUpdatedAt TEXT
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
  Future update(TableQuestionDVLA value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionDVLA, where: '''
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
    await db!.update(tableQuestionDVLA, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
