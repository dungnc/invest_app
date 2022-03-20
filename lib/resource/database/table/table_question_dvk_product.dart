const String tableQuestionDVKProduct = 'QuestionDVKProduct';
const String questionDVKProductId = '_id';
const String questionDVKProductNam = 'Nam';
const String questionDVKProductThang = 'Thang';
const String questionDVKProductIDDonVi = 'IDDonVi';
const String questionDVKProductSTTSanPham = 'STT_SanPham';
const String questionDVKProductC21 = 'C2_1';
const String questionDVKProductC22 = 'C2_2';
const String questionDVKProductC311 = 'C3_1';
const String questionDVKProductC312 = 'C3_2';
const String questionDVKProductC41 = 'C4_1';
const String questionDVKProductC42 = 'C4_2';
const String questionDVKProductCreatedAt = 'CreatedAt';
const String questionDVKProductUpdatedAt = 'UpdatedAt';

class TableQuestionDVKProduct {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  int? sTTSanPham;
  double? c21;
  double? c22;
  double? c31;
  double? c32;
  int? c41;
  int? c42;
  String? createdAt;
  String? updatedAt;

  TableQuestionDVKProduct({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.sTTSanPham,
    this.c21,
    this.c22,
    this.c31,
    this.c32,
    this.c41,
    this.c42,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionDVKProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    c21 = json['C2_1'];
    c22 = json['C2_2'];
    c31 = json['C3_1'];
    c32 = json['C3_2'];
    c41 = json['C4_1'];
    c42 = json['C4_2'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['IDDonVi'] = iDDonVi;
    data['STT_SanPham'] = sTTSanPham;
    data['C2_1'] = c21;
    data['C2_2'] = c22;
    data['C3_1'] = c31;
    data['C3_2'] = c32;
    data['C4_1'] = c41;
    data['C4_2'] = c42;

    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionDVKProduct>? listFromJson(dynamic json) {
    List<TableQuestionDVKProduct> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionDVKProduct.fromJson(item));
      }
    }
    return list;
  }
}
