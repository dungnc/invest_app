const String tableQuestionCNProduct = 'QuestionCNProduct';
const String questionProductCNId = '_id';
const String questionProductCNNam = 'Nam';
const String questionProductCNThang = 'Thang';
const String questionProductCNIDDonVi = 'IDDonVi';
const String questionProductCNSTTSanPham = 'STT_SanPham';
const String questionProductCNC2_1 = 'C2_1';
const String questionProductCNC2_2 = 'C2_2';
const String questionProductCNC2_3 = 'C2_3';
const String questionProductCNC2_41 = 'C2_41';
const String questionProductCNC2_42 = 'C2_42';
const String questionProductCNCreatedAt = 'CreatedAt';
const String questionProductCNUpdatedAt = 'UpdatedAt';

class TableQuestionCNProduct {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  int? sTTSanPham;
  String? c2_1;
  String? c2_2;
  String? c2_3;
  double? c2_41;
  double? c2_42;
  String? createdAt;
  String? updatedAt;

  TableQuestionCNProduct({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.sTTSanPham,
    this.c2_1,
    this.c2_2,
    this.c2_3,
    this.c2_41,
    this.c2_42,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionCNProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    c2_1 = json['C2_1'];
    c2_2 = json['C2_2'];
    c2_3 = json['C2_3'];
    c2_41 = json['C2_41'];
    c2_42 = json['C2_42'];
    createdAt = json['CreatedAt'];
    updatedAt = json['Updatedat'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['IDDonVi'] = iDDonVi;
    data['STT_SanPham'] = sTTSanPham;
    data['C2_1'] = c2_1;
    data['C2_2'] = c2_2;
    data['C2_3'] = c2_3;
    data['C2_41'] = c2_41;
    data['C2_42'] = c2_42;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionCNProduct> fromListJson(dynamic json) {
    List<TableQuestionCNProduct> list = [];
    for (var item in json) {
      list.add(TableQuestionCNProduct.fromJson(item));
    }

    return list;
  }
}
