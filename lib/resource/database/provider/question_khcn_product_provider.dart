import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionKHCNProductProvider
    extends BaseDBProvider<TableQuestionKHCNProduct> {
  static final QuestionKHCNProductProvider _singleton =
      QuestionKHCNProductProvider._internal();

  factory QuestionKHCNProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionKHCNProductProvider._internal();
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
      ids.add(await db!.insert(tableQuestionKHCNProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionKHCNProduct
      (
        $questionKHCNProductId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionKHCNProductNam INTEGER,
        $questionKHCNProductThang INTEGER,
        $questionKHCNProductIDDonVi TEXT,
        $questionKHCNProductSTTSanPham INTEGER,
        $questionKHCNProductC21 REAL,
        $questionKHCNProductC22 REAL,
        $questionKHCNProductCreatedAt TEXT,
        $questionKHCNProductUpdatedAt TEXT
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
  Future update(TableQuestionKHCNProduct value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionKHCNProductUpdatedAt: DateTime.now().toString(),
    };
    await db!.update(tableQuestionKHCNProduct, values,
        where: '$questionKHCNProductId = ?', whereArgs: [columId]);
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionKHCNProduct, where: '''
        $questionKHCNProductIDDonVi = "$iDDV" 
      AND $questionKHCNProductCreatedAt= "$createAt"
      ''');

    return _maps;
  }
}
