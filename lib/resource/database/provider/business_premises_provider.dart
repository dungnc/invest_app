import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/config/constants/app_defind.dart';
import 'package:statistical_survey/resource/resource.dart';

class BusinessPremisesProvider extends BaseDBProvider<TableBackup> {
  static final BusinessPremisesProvider _singleton =
      BusinessPremisesProvider._internal();

  factory BusinessPremisesProvider() {
    return _singleton;
  }

  Database? db;
  String createdAt = AppPref.dateTimeSaveDB ?? '';

  BusinessPremisesProvider._internal();
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
      ids.add(await db!.insert(tableBusinessPremises, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableBusinessPremises
      (
        $businessPremisesId INTEGER PRIMARY KEY AUTOINCREMENT,
        $businessPremisesNam INTEGER,
        $businessPremisesThang INTEGER,
        $businessPremisesQuy INTEGER,
        $businessPremisesIDDonVi TEXT,
        $businessPremisesMaTinh TEXT,
        $businessPremisesTenTinh TEXT,
        $businessPremisesMaHuyen TEXT,
        $businessPremisesTenHuyen TEXT,
        $businessPremisesMaXa TEXT,
        $businessPremisesTenXa TEXT,
        $businessPremisesMaDiaBan TEXT,
        $businessPremisesTenDiaBan TEXT,
        $businessPremisesMaDonVi INTEGER,
        $businessPremisesTenDonVi TEXT,
        $businessPremisesMaSoThue TEXT,
        $businessPremisesDiaChi TEXT,
        $businessPremisesMaDiaDiem INTEGER,
        $businessPremisesTenDiaDiem TEXT,
        $businessPremisesDienThoai TEXT,
        $businessPremisesMaTinhTrangHD INTEGER,
        $businessPremisesMauThang INTEGER,
        $businessPremisesMauQuy INTEGER,
        $businessPremisesMauHH INTEGER,
        $businessPremisesMauDVLA INTEGER,
        $businessPremisesMauDVDVK INTEGER,
        $businessPremisesMauDVKHCN INTEGER,
        $businessPremisesMauBoSung INTEGER,
        $businessPremisesTenNguoiCungCap TEXT,
        $businessPremisesSDTNguoiCungCap TEXT,
        $businessPremisesMaDTV TEXT,
        $businessPremisesMaTrangThaiDT INTEGER,
        $businessPremisesCreatedAt TEXT,
        $businessPremisesUpdatedAt TEXT
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

  Future<Map> selectHo(String idHO, String maDTV) async {
    List<Map> maps = await db!.rawQuery('''
      SELECT * FROM $tableBusinessPremises WHERE $businessPremisesIDDonVi = $idHO AND $businessPremisesMaDTV=$maDTV
    ''');

    return maps.isNotEmpty ? maps[0] : {};
  }

  Future<int?> countOfUnInterviewed(
      String idDB, String createAt, String maXa, String maHuyen) async {
    int? count = Sqflite.firstIntValue(await db!.rawQuery('''
      SELECT COUNT(*) FROM $tableBusinessPremises
      WHERE $businessPremisesMaTrangThaiDT = ${AppDefind.chuaPhongVan} 
      AND $businessPremisesMaDiaBan= '$idDB'
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      '''));

    return count;
  }

  Future<int?> countOfInterviewed(
      String idDB, String createAt, String maXa, String maHuyen) async {
    int? count = Sqflite.firstIntValue(await db!.rawQuery('''
      SELECT COUNT(*) FROM $tableBusinessPremises
      WHERE $businessPremisesMaTrangThaiDT = ${AppDefind.hoangThanhPhongVan} 
      AND $businessPremisesMaDiaBan= '$idDB'
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      '''));

    return count;
  }

  Future<List<Map>> selectListUnInterviewed(
    String idDiaban,
    String createAt,
    String maXa,
    String maHuyen,
  ) async {
    final List<Map> maps = await db!.query(tableBusinessPremises, where: '''
      $businessPremisesMaTrangThaiDT = ${AppDefind.chuaPhongVan}
      AND $businessPremisesMaDiaBan= "$idDiaban"
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      ''');

    return maps;
  }

  Future<List<Map>> selectListInterviewed(
      String idDiaban, String createAt, String maXa, String maHuyen) async {
    final List<Map> maps = await db!.query(tableBusinessPremises, where: '''
      $businessPremisesMaTrangThaiDT = ${AppDefind.hoangThanhPhongVan} 
      AND $businessPremisesMaDiaBan= "$idDiaban"
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      ''');

    return maps;
  }

  Future<List<Map>> selectAllListInterviewed(String createAt) async {
    final List<Map> maps = await db!.query(tableBusinessPremises, where: '''
      $businessPremisesMaTrangThaiDT = ${AppDefind.hoangThanhPhongVan} 
      AND $businessPremisesCreatedAt= "$createAt"
      ''');

    return maps;
  }

  Future<List<Map>> searchListInterviewed(String idDiaban, String createAt,
      String search, String maXa, String maHuyen) async {
    final List<Map> maps = await db!.query(tableBusinessPremises, where: '''
      $businessPremisesMaTrangThaiDT = ${AppDefind.hoangThanhPhongVan} 
      AND $businessPremisesMaDiaBan= "$idDiaban" 
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      AND $businessPremisesTenNguoiCungCap LIKE '%$search%'
      OR $businessPremisesTenNguoiCungCap LIKE '%$search'
      ''');

    return maps;
  }

  Future<List<Map>> searchListUnInterviewed(String idDiaban, String createAt,
      String search, String maXa, String maHuyen) async {
    final List<Map> maps = await db!.query(tableBusinessPremises, where: '''
      $businessPremisesMaTrangThaiDT = ${AppDefind.chuaPhongVan}
      AND $businessPremisesMaDiaBan= "$idDiaban"
      AND $businessPremisesCreatedAt= "$createAt"
      AND $businessPremisesMaXa= "$maXa"
      AND $businessPremisesMaHuyen= "$maHuyen"
      AND $businessPremisesTenNguoiCungCap LIKE '%$search%'
      OR $businessPremisesTenNguoiCungCap LIKE '%$search'
      ''');

    return maps;
  }

  Future<Map> getInformation(String iDDonVi, String createAt) async {
    log('createdTime: $createdAt');
    // List<Map> map = await db!.query(tableBusinessPremises, where: '''
    //   $businessPremisesCreatedAt = '$createdAt'
    //   AND $businessPremisesIDDonVi = '$iDDonVi'
    // ''');
    List<Map> map = await db!.rawQuery('''
    SELECT * FROM $tableBusinessPremises
      WHERE $businessPremisesCreatedAt = '$createdAt'
      AND $businessPremisesIDDonVi = '$iDDonVi'
    ''');
    return map[0];
  }

  Future updateTrangThai(String iDDonVi, String createAt) async {
    Map<String, Object?> values = {
      businessPremisesMaTrangThaiDT: AppDefind.hoangThanhPhongVan,
      "UpdatedAt": DateTime.now().toIso8601String()
    };
    await db!.update(tableBusinessPremises, values,
        where: '$businessPremisesIDDonVi= ?', whereArgs: [iDDonVi]);
  }
}
