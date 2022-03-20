import 'package:statistical_survey/resource/database/database.dart';
import 'package:statistical_survey/resource/database/table/table_status.dart';

const String tableLocality = 'Locality';
const String localityId = '_id';
const String localityMaDiaban = 'MaDiaBan';
const String localityTenDiaBan = 'TenDiaBan';
const String localityMaTinh = 'MaTinh';
const String localityMaHuyen = 'MaHuyen';
const String localityMaXa = 'MaXa';
const String localityCreatedAt = 'CreatedAt';
const String localityUpdatedAt = 'UpdatedAt';

class TableLocality {
  int? id;
  String? maDiaBan;
  String? tenDiaBan;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  List<TableStatus>? status;
  String? createdAt;
  String? updatedAt;

  TableLocality({
    this.id,
    this.maDiaBan,
    this.tenDiaBan,
    this.maTinh,
    this.maHuyen,
    this.maXa,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  TableLocality.fromJson(Map json) {
    id = json['_id'];
    maDiaBan = json['MaDiaBan'];
    tenDiaBan = json['TenDiaBan'];
    maTinh = json['MaTinh'];
    maHuyen = json['MaHuyen'];
    maXa = json['MaXa'];
    status =
        TableStatus.listFromJson(json['TrangThaiDanhSachCoSoSXKD']);
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['MaDiaBan'] = maDiaBan;
    data['TenDiaBan'] = tenDiaBan;
    data['MaTinh'] = maTinh;
    data['MaHuyen'] = maHuyen;
    data['MaXa'] = maXa;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableLocality> listFromJson(dynamic localities) {
    List<TableLocality> list = [];
    if (localities != null) {
      for (var item in localities) {
        list.add(TableLocality.fromJson(item));
      }
    }
    return list;
  }
}
