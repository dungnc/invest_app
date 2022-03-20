import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionDVLAProductProvider
    extends BaseDBProvider<TableQuestionDVLAProduct> {
  static final QuestionDVLAProductProvider _singleton =
      QuestionDVLAProductProvider._internal();

  factory QuestionDVLAProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionDVLAProductProvider._internal();
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
      ids.add(await db!.insert(tableQuestionDVLAProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionDVLAProduct
      (
        $questionDVLAProductId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionDVLAProductNam INTEGER,
        $questionDVLAProductThang INTEGER,
        $questionDVLAProductIDDonVi TEXT,
        $questionDVLAProductSTTSanPham INTEGER,
        $questionDVLAProductC2_1 REAL,
        $questionDVLAProductC2_2 REAL,
        $questionDVLAProductC2_3 REAL,
        $questionDVLAProductC3 INTEGER,
        $questionDVLAProductC3_11 REAL,
        $questionDVLAProductC3_12 REAL,
        $questionDVLAProductC3_13 REAL,
        $questionDVLAProductCreatedAt TEXT,
        $questionDVLAProductUpdatedAt TEXT
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
  Future update(TableQuestionDVLAProduct value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionDVLAProduct, where: '''
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
    await db!.update(tableQuestionDVLAProduct, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
