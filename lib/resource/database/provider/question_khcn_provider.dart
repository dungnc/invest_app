import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class QuestionKHCNProvider extends BaseDBProvider<TableQuestionKHCN> {
  static final QuestionKHCNProvider _singleton =
      QuestionKHCNProvider._internal();

  factory QuestionKHCNProvider() {
    return _singleton;
  }

  Database? db;

  QuestionKHCNProvider._internal();
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
      ids.add(await db!.insert(tableQuestionKHCN, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionKHCN
      (
        $questionKHCNId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionKHCNNam INTEGER,
        $questionKHCNThang INTEGER,
        $questionKHCNIDDonVi TEXT,
        $questionKHCNMaTinh TEXT,
        $questionKHCNMaHuyen TEXT,
        $questionKHCNMaXa TEXT,
        $questionKHCNMaDiaBan TEXT,
        $questionKHCNMaDonVi INTEGER,
        $questionKHCNMaTinhTrangHD INTEGER,
        $questionKHCNC11 REAL,
        $questionKHCNC12 REAL,
        $questionKHCNC3 TEXT,
        $questionKHCNC3GhiRo TEXT,
        $questionKHCNMaDTV TEXT,
        $questionKHCNKinhDo REAL,
        $questionKHCNViDo REAL,
        $questionKHCNNguoiTraLoi TEXT,
        $questionKHCNSoDienThoai TEXT,
        $questionKHCNThoiGianBD TEXT,
        $questionKHCNThoiGianKT TEXT,
        $questionKHCNCreatedAt TEXT,
        $questionKHCNUpdatedAt TEXT
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
  Future update(TableQuestionKHCN value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithIDDV(String iDDV, String? createAt) async {
    final List<Map> _maps = await db!.query(tableQuestionKHCN, where: '''
        $questionKHCNIDDonVi = "$iDDV" 
      AND $questionKHCNCreatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionKHCNProductUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionKHCN, values,
        where: '$questionKHCNId = ?', whereArgs: [columId]);
  }
}
