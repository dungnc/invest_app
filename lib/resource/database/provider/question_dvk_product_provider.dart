import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionDVKProductProvider
    extends BaseDBProvider<TableQuestionDVKProduct> {
  static final QuestionDVKProductProvider _singleton =
      QuestionDVKProductProvider._internal();

  factory QuestionDVKProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionDVKProductProvider._internal();
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
      ids.add(await db!.insert(tableQuestionDVKProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionDVKProduct
      (
        $questionDVKProductId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionDVKProductNam INTEGER,
        $questionDVKProductThang INTEGER,
        $questionDVKProductIDDonVi TEXT,
        $questionDVKProductSTTSanPham INTEGER,
        $questionDVKProductC21 REAL,
        $questionDVKProductC22 REAL,
        $questionDVKProductC311 REAL,
        $questionDVKProductC312 REAL,
        $questionDVKProductC41 INTEGER,
        $questionDVKProductC42 INTEGER,      
        $questionDVKProductCreatedAt TEXT,
        $questionDVKProductUpdatedAt TEXT
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
  Future update(TableQuestionDVKProduct value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionDVKProduct, where: '''
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
    await db!.update(tableQuestionDVKProduct, values,
        where: '$questionDVKId = ?', whereArgs: [columId]);
  }
}
