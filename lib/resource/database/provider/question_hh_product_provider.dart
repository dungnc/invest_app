import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionHHProductProvider extends BaseDBProvider<TableQuestionHHProduct> {
  static final QuestionHHProductProvider _singleton =
      QuestionHHProductProvider._internal();

  factory QuestionHHProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionHHProductProvider._internal();
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
      List<Map<String, dynamic>> value, String createdAt) async {
    List<int> ids = [];
    for (Map<String, Object?> item in value) {
      ids.add(await db!.insert(tableQuestionHHProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionHHProduct
      (
        $questionHHProductId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionHHProductNam INTEGER,
        $questionHHProductThang INTEGER,
        $questionHHProductIDDonVi TEXT,
        $questionHHProductSTTSanPham INTEGER,
        $questionHHProductC21 REAL,
        $questionHHProductC22 REAL,
        $questionHHProductC23 REAL,
        $questionHHProductC3 INTEGER,
        $questionHHProductC311 REAL,
        $questionHHProductC312 REAL,
        $questionHHProductC313 REAL,
        $questionHHProductCreatedAt TEXT,
        $questionHHProductUpdatedAt TEXT
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
  Future update(TableQuestionHHProduct value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionHHProduct, where: '''
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
    await db!.update(tableQuestionHHProduct, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
