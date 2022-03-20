import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionVTProductProvider extends BaseDBProvider<TableQuestionVTProduct> {
  static final QuestionVTProductProvider _singleton =
      QuestionVTProductProvider._internal();

  factory QuestionVTProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionVTProductProvider._internal();
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
      ids.add(await db!.insert(tableQuestionVTProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionVTProduct
      (
        $questionVTProductId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionVTProductNam INTEGER,
        $questionVTProductThang INTEGER,
        $questionVTProductIDDonVi TEXT,
        $questionVTProductSTTSanPham INTEGER,
        $questionVTProductC2_1 REAL,
        $questionVTProductC2_2 REAL,
        $questionVTProductCreatedAt TEXT,
        $questionVTProductUpdatedAt TEXT
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
  Future update(TableQuestionVTProduct value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionVTProductUpdatedAt: DateTime.now().toString(),
    };
    await db!.update(tableQuestionVTProduct, values,
        where: '$questionVTProductId = ?', whereArgs: [columId]);
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionVTProduct, where: '''
        $questionVTProductIDDonVi = "$iDDV" 
      AND $questionVTProductCreatedAt= "$createAt"
      ''');

    return _maps;
  }
}
