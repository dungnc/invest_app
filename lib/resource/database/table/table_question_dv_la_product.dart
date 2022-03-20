import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionDVLAProduct = 'QuestionDVLAProduct';
const String questionDVLAProductId = '_id';
const String questionDVLAProductNam = 'Nam';
const String questionDVLAProductThang = 'Thang';
const String questionDVLAProductIDDonVi = 'IDDonVi';
const String questionDVLAProductSTTSanPham = 'STT_SanPham';
const String questionDVLAProductC2_1 = 'C2_1';
const String questionDVLAProductC2_2 = 'C2_2';
const String questionDVLAProductC2_3 = 'C2_3';
const String questionDVLAProductC3 = 'C3';
const String questionDVLAProductC3_11 = 'C3_11';
const String questionDVLAProductC3_12 = 'C3_12';
const String questionDVLAProductC3_13 = 'C3_13';
const String questionDVLAProductCreatedAt = 'CreatedAt';
const String questionDVLAProductUpdatedAt = 'UpdatedAt';

class TableQuestionDVLAProduct {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  int? sTTSanPham;
  double? c21;
  double? c22;
  double? c23;
  int? c3;
  double? c311;
  double? c312;
  double? c313;
  String? createdAt;
  String? updatedAt;

  TableQuestionDVLAProduct({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.sTTSanPham,
    this.c21,
    this.c22,
    this.c23,
    this.c3,
    this.c311,
    this.c312,
    this.c313,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionDVLAProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    c21 = json['C2_1'];
    c22 = json['C2_2'];
    c23 = json['C2_3'];
    c3 = json['C3'];
    c311 = json['C3_11'];
    c312 = json['C3_12'];
    c313 = json['C3_13'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['IDDonVi'] = iDDonVi;
    data['STT_SanPham'] = sTTSanPham;
    data['C2_1'] = c21;
    data['C2_2'] = c22;
    data['C2_3'] = c23;
    data['C3'] = c3;
    data['C3_11'] = c311;
    data['C3_12'] = c312;
    data['C3_13'] = c313;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionDVLAProduct>? listFromJson(dynamic json) {
    List<TableQuestionDVLAProduct> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionDVLAProduct.fromJson(item));
      }
    }
    return list;
  }
}
