const String tableQuestionVTProduct = 'QuestionVTProduct';
const String questionVTProductId = '_id';
const String questionVTProductNam = 'Nam';
const String questionVTProductThang = 'Thang';
const String questionVTProductIDDonVi = 'IDDonVi';
const String questionVTProductSTTSanPham = 'STT_SanPham';
const String questionVTProductC2_1 = 'C2_1';
const String questionVTProductC2_2 = 'C2_2';
const String questionVTProductC3 = 'C3';
const String questionVTProductC3_11 = 'C3_11';
const String questionVTProductC3_12 = 'C3_12';
const String questionVTProductC3_13 = 'C3_13';
const String questionVTProductCreatedAt = 'CreatedAt';
const String questionVTProductUpdatedAt = 'UpdatedAt';

class TableQuestionVTProduct {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  int? sTTSanPham;
  double? c21;
  double? c22;
  double? c3;
  double? c311;
  double? c312;
  double? c313;
  String? createdAt;
  String? updatedAt;

  TableQuestionVTProduct({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.sTTSanPham,
    this.c21,
    this.c22,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionVTProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    c21 = json['C2_1'];
    c22 = json['C2_2'];
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
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionVTProduct>? fromListJson(dynamic json) {
    List<TableQuestionVTProduct> list = [];

    for (var item in json) {
      list.add(TableQuestionVTProduct.fromJson(item));
    }

    return list;
  }
}
