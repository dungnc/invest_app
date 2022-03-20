import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionVTProvider extends BaseDBProvider<TableQuestionVT> {
  static final QuestionVTProvider _singleton = QuestionVTProvider._internal();

  factory QuestionVTProvider() {
    return _singleton;
  }

  Database? db;

  QuestionVTProvider._internal();

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
    for (var item in value) {
      ids.add(await db!.insert(tableQuestionVT, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionVT
      (
        $questionVTId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionVTNam INTEGER,
        $questionVTThang INTEGER,
        $questionVTIDDonVi TEXT,
        $questionVTMaTinh TEXT,
        $questionVTMaHuyen TEXT,
        $questionVTMaXa TEXT,
        $questionVTMaDiaBan TEXT,
        $questionVTMaDonVi INTEGER,
        $questionVTMaTinhTrang INTEGER,
        $questionVTC1_1 REAL,
        $questionVTC1_2 REAL,
        $questionVTC3_1 INTEGER,
        $questionVTC3_2 INTEGER,
        $questionVTC4_1 INTEGER,
        $questionVTC4_2 INTEGER,
        $questionVTC5 INTEGER,
        $questionVTC6_1 INTEGER,
        $questionVTC6_2 INTEGER,
        $questionVTC6_31 INTEGER,
        $questionVTC6_32 INTEGER,
        $questionVTC7_1 INTEGER,
        $questionVTC7_2 INTEGER,
        $questionVTC7_31 INTEGER,
        $questionVTC7_32 INTEGER,
        $questionVTC8_1 REAL,
        $questionVTC8_2 REAL,
        $questionVTC8_31 REAL,
        $questionVTC8_32 REAL,
        $questionVTC9_1 REAL,
        $questionVTC9_2 REAL,
        $questionVTC10_1 INTEGER,
        $questionVTC10_2 INTEGER,
        $questionVTC10_31 INTEGER,
        $questionVTC10_32 INTEGER,
        $questionVTC11_1 REAL,
        $questionVTC11_2 REAL,
        $questionVTC11_31 REAL,
        $questionVTC11_32 REAL,
        $questionVTC12_1 INTEGER,
        $questionVTC12_2 INTEGER,
        $questionVTC13_1 REAL,
        $questionVTC13_2 REAL,
        $questionVTC14 INTEGER,
        $questionVTC15_1 INTEGER,
        $questionVTC15_2 INTEGER,
        $questionVTC15_31 INTEGER,
        $questionVTC15_32 INTEGER,
        $questionVTC16_1 REAL,
        $questionVTC16_2 REAL,
        $questionVTC16_31 REAL,
        $questionVTC16_32 REAL,
        $questionVTC17_1 REAL,
        $questionVTC17_2 REAL,
        $questionVTC17_31 REAL,
        $questionVTC17_32 REAL,
        $questionVTC18_1 REAL,
        $questionVTC18_2 REAL,
        $questionVTC19_1 REAL,
        $questionVTC19_2 REAL,
        $questionVTC19_31 REAL,
        $questionVTC19_32 REAL,
        $questionVTC20_1 REAL,
        $questionVTC20_2 REAL,
        $questionVTC20_31 REAL,
        $questionVTC20_32 REAL,
        $questionVTC21 TEXT,
        $questionVTC21GhiRo TEXT,
        $questionVTMaDTV TEXT,
        $questionVTKinhdo REAL,
        $questionVTVido REAL,
        $questionVTNguoiTraLoi TEXT,
        $questionVTSoDienThoai TEXT,
        $questionVTThoiGianBD TEXT,
        $questionVTThoiGianKT TEXT,
        $questionVTCreatedAt TEXT,
        $questionVTUpdatedAt TEXT
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
  Future update(TableQuestionVT value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionVT, where: '''
        $questionVTIDDonVi = "$iDDV" 
      AND $questionVTCreatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionVTUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionVT, values,
        where: '$questionVTId = ?', whereArgs: [columId]);
  }
}
