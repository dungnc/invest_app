import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/resource.dart';

class QuestionCNProductProvider extends BaseDBProvider {
  static final QuestionCNProductProvider _singleton =
      QuestionCNProductProvider._internal();

  factory QuestionCNProductProvider() {
    return _singleton;
  }

  Database? db;

  QuestionCNProductProvider._internal();
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
    for (var item in value) {
      ids.add(await db!.insert(tableQuestionCNProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionCNProduct
      (
        $questionProductCNId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionProductCNNam INTEGER,
        $questionProductCNThang INTEGER,
        $questionProductCNIDDonVi TEXT,
        $questionProductCNSTTSanPham TEXT,
        $questionProductCNC2_1 TEXT,
        $questionProductCNC2_2 TEXT,
        $questionProductCNC2_3 TEXT,
        $questionProductCNC2_41 REAL,
        $questionProductCNC2_42 REAL,
        $questionProductCNCreatedAt TEXT,
        $questionProductCNUpdatedAt TEXT
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
  Future update(value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionCNProduct, where: '''
        $questionCNIDDonVi = "$iDDV" 
      AND $questionProductCNUpdatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionProductCNUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionCNProduct, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
