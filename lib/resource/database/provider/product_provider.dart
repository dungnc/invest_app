import 'package:sqflite/sqflite.dart';
import 'package:statistical_survey/resource/resource.dart';

class ProductProvider extends BaseDBProvider {
  static final ProductProvider _singleton = ProductProvider._internal();

  factory ProductProvider() {
    return _singleton;
  }

  Database? db;

  ProductProvider._internal();

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
      ids.add(await db!.insert(tableProduct, item));
    }
    return ids;
  }

  @override
  Future createTable() async {
    return await db!.execute('''
    CREATE TABLE IF NOT EXISTS $tableProduct
      (
        $productId INTEGER PRIMARY KEY AUTOINCREMENT,
        $productNam INTEGER,
        $productThang INTEGER,
        $productQuy INTEGER,
        $productIDDonVi TEXT,
        $productSTTSanPham INTEGER,
        $productMaSanPham TEXT,
        $productTenSanPham TEXT,
        $productDonViTinh TEXT,
        $productDoanhThuBinhQuan REAL,
        $productMaPhieu INTEGER,
        $productTenPhieu TEXT,
        $productBangDuLieuPhieu TEXT,
        $productGhiChuPhieu TEXT,
        $productCreatedAt TEXT,
        $productUpdatedAt TEXT
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
    final List<Map> _maps = await db!.query(tableProduct, where: '''
        $productIDDonVi = $iDDV 
        AND $productCreatedAt = '$createAt'
      ''');

    return _maps;
  }

  Future<List<Map>> selectWithIDPhieu(
      String iDDV, String? createAt, int maPhieu) async {
    final List<Map> _maps = await db!.query(tableProduct, where: '''
        $productIDDonVi = $iDDV 
        AND $productCreatedAt = '$createAt'
        AND $productMaPhieu= '$maPhieu'
      ''');

    return _maps;
  }
}
