import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/database/database.dart';

class BackupProvider extends BaseDBProvider<TableBackup> {
  static final BackupProvider _singleton = BackupProvider._internal();

  factory BackupProvider() {
    return _singleton;
  }

  Database? db;

  BackupProvider._internal();
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
    int id = await db!.insert(tableBackup, value[0]);
    ids.add(id);
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
      CREATE TABLE IF NOT EXISTS $tableBackup
      (
        $backupId INTEGER PRIMARY KEY AUTOINCREMENT,
        $backupMaDangNhap TEXT,
        $backupTenNguoiDung TEXT,
        $backupMatKhau TEXT,
        $backupMaTinh TEXT,
        $backupMaPBCC TEXT,
        $backupDiaChi TEXT,
        $backupSDT TEXT,
        $backupGhiChu TEXT,
        $backupNgayCapNhat TEXT,
        $backupActive INTEGER,
        $backupCreatedAt TEXT,
        $backupUpdatedAt TEXT,
        $backupIsSuccess INTEGER
      )
      ''');
  }

  @override
  Future<List<Map>> selectAll() {
    // TODO: implement selectAll
    throw UnimplementedError();
  }

  @override
  Future<Map> selectOne(int id) async {
    try {
      List<Map> maps = await db!.rawQuery('''
      SELECT * FROM $tableBackup WHERE $backupId = $id
    ''');
      return maps[0];
    } on DatabaseException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future update(value, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<Map>> selectWithDTV(String? idDTV) async {
    try {
      List<Map> maps = await db!.rawQuery('''
     SELECT * FROM $tableBackup
    WHERE $backupMaDangNhap = '$idDTV'
    AND $backupIsSuccess = 1
    ORDER BY $backupId DESC
    LIMIT 1
    ''');
      return maps;
    } on DatabaseException catch (e) {
      log(e.toString());
      throw e.toString();
    } catch (e) {
      log(e.toString());

      throw e.toString();
    }
  }
}
