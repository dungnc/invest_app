const String tableQuestionHHProduct = 'QuestionHHProduct';
const String questionHHProductId = '_id';
const String questionHHProductNam = 'Nam';
const String questionHHProductThang = 'Thang';
const String questionHHProductIDDonVi = 'IDDonVi';
const String questionHHProductSTTSanPham = 'STT_SanPham';
const String questionHHProductC21 = 'C2_1';
const String questionHHProductC22 = 'C2_2';
const String questionHHProductC23 = 'C2_3';
const String questionHHProductC3 = 'C3';
const String questionHHProductC311 = 'C3_11';
const String questionHHProductC312 = 'C3_12';
const String questionHHProductC313 = 'C3_13';
const String questionHHProductCreatedAt = 'CreatedAt';
const String questionHHProductUpdatedAt = 'UpdatedAt';

class TableQuestionHHProduct {
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

  TableQuestionHHProduct({
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

  TableQuestionHHProduct.fromJson(dynamic json) {
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

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
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

  static List<TableQuestionHHProduct>? listFromJson(dynamic json) {
    List<TableQuestionHHProduct> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionHHProduct.fromJson(item));
      }
    }
    return list;
  }
}
