import 'package:statistical_survey/resource/database/database.dart';

const String tableStatus = 'Status';
const String statusId = '_id';
const String statusMaTrangThaiDT = 'MaTrangThaiDT';
const String statusTenTrangThaiDT = 'TenTrangThaiDT';
const String statusCreatedAt = 'CreatedAt';
const String statusUpdatedAt = 'UpdatedAt';

class TableStatus {
  int? id;
  int? maTrangThaiDT;
  String? tenTrangThaiDT;
  List<TableBusinessPremises>? businessPremises;
  String? createdAt;
  String? updatedAt;

  TableStatus({
    this.id,
    this.maTrangThaiDT,
    this.tenTrangThaiDT,
    this.businessPremises,
    this.createdAt,
    this.updatedAt,
  });

  TableStatus.fromJson(dynamic json) {
    id = json['_id'];
    maTrangThaiDT = json['MaTrangThaiDT'];
    tenTrangThaiDT = json['TenTrangThaiDT'];
    businessPremises = TableBusinessPremises.listFromJson(json['DanhSachCoSoSXKD_PV']);
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map toJson() {
    var map = <String, dynamic>{};
    map['MaTrangThaiDT'] = maTrangThaiDT;
    map['TenTrangThaiDT'] = tenTrangThaiDT;
    map['CreatedAt'] = createdAt;
    map['UpdatedAt'] = updatedAt;
    return map;
  }

  static List<TableStatus>? listFromJson(json) {
    List<TableStatus> list = [];
    if(json != null){
      for (var item in json) {
        list.add(TableStatus.fromJson(item));
      }
    }
    return list;
  }
}
