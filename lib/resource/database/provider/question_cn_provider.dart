import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/resource.dart';

class QuestionCNProvider extends BaseDBProvider<TableQuestionCN> {
  static final QuestionCNProvider _singleton = QuestionCNProvider._internal();

  factory QuestionCNProvider() {
    return _singleton;
  }

  Database? db;

  QuestionCNProvider._internal();

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
      ids.add(await db!.insert(tableQuestionCN, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableQuestionCN
      (
        $questionCNId INTEGER PRIMARY KEY AUTOINCREMENT,
        $questionCNNam INTEGER,
        $questionCNThang INTEGER,
        $questionCNIDDonVi TEXT,
        $questionCNMaTinh TEXT,
        $questionCNMaHuyen TEXT,
        $questionCNMaXa TEXT,
        $questionCNMaDiaBan TEXT,
        $questionCNMaDonVi REAL,
        $questionCNMaTinhTrangHD REAL,
        $questionCNC1_1 REAL,
        $questionCNC1_2 REAL,
        $questionCNC TEXT,
        $questionCNMaDTV TEXT,
        $questionCNKinhDo REAL,
        $questionCNViDo REAL,
        $questionCNNguoiTraLoi TEXT,
        $questionCNSoDienThoai TEXT,
        $questionCNThoiGianDB TEXT,
        $questionCNThoiGianKT TEXT,
        $questionCNCreatedAt TEXT,
        $questionCNUpdatedAt TEXT
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
    final List<Map> _maps = await db!.query(tableQuestionCN, where: '''
        $questionCNIDDonVi = "$iDDV" 
      AND $questionCNCreatedAt= "$createAt"
      ''');

    return _maps;
  }

  // update value after answer
  Future updateValue(String key, value, columId) async {
    Map<String, Object?> values = {
      key: value,
      questionCNUpdatedAt: DateTime.now().toIso8601String()
    };
    await db!.update(tableQuestionCN, values,
        where: '$questionHHId = ?', whereArgs: [columId]);
  }
}
