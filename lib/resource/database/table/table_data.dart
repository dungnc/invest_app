import 'dart:convert';

import 'package:statistical_survey/resource/database/table/table_status.dart';
import 'package:statistical_survey/resource/resource.dart';

const String tableData = 'Datas';
const String dataId = '_id';
const String dataData = 'Data';
const String dataCreatedAt = 'CreatedAt';
const String dataUpdatedAt = 'UpdatedAt';

class TableData {
  int? id;
  String? data;
  String? createdAt;
  String? updatedAt;

  TableData({
    this.id,
    this.data,
    this.createdAt,
    this.updatedAt,
  });

  TableData.fromJson(dynamic json) {
    id = json['_id'];
    data = json['Data'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map toJson() {
    var map = <String, dynamic>{};
    map['Data'] = data;
    map['CreatedAt'] = createdAt;
    map['UpdatedAt'] = updatedAt;
    return map;
  }

  Map toDataJson() {
    return jsonDecode(data!)['Datas'];
  }

  List<dynamic> toLocalities() {
    return jsonDecode(data!)['Datas'];
  }

  List<TableBusinessPremises> toBusinesPremises() {
    List<dynamic> localities = toLocalities();
    List<TableLocality> _listLocality = [];
    List<TableStatus> _status = [];
    List<TableBusinessPremises> _businessPremises = [];
    for (var locality in localities) {
      _listLocality.add(TableLocality.fromJson(locality));
    }

    for (var element in _listLocality) {
      _status.addAll(element.status ?? []);
    }
    for (var item in _status) {
      _businessPremises.addAll(item.businessPremises ?? []);
    }

    return _businessPremises;
  }

  List<TableProduct> toProducts() {
    List<TableBusinessPremises> _businessPremises = toBusinesPremises();
    List<TableProduct> _products = [];
    for (var item in _businessPremises) {
      _products.addAll(item.products ?? []);
    }
    return _products;
  }
  
  dynamic toPhieu02() {
    return jsonDecode(data!)['DanhSachCauHoiPhieu'][1]['DanhSachCauHoi'];
  }

  dynamic toPhieu(int phieu) {
    return jsonDecode(data!)['DanhSachCauHoiPhieu'][phieu - 1]
        ['DanhSachCauHoi'];
  }
}
