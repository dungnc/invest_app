const String tableQuestionKHCNProduct = 'QuestionKHCNProduct';
const String questionKHCNProductId = '_id';
const String questionKHCNProductNam = 'Nam';
const String questionKHCNProductThang = 'Thang';
const String questionKHCNProductIDDonVi = 'IDDonVi';
const String questionKHCNProductSTTSanPham = 'STT_SanPham';
const String questionKHCNProductC21 = 'C2_1';
const String questionKHCNProductC22 = 'C2_2';
const String questionKHCNProductCreatedAt = 'CreatedAt';
const String questionKHCNProductUpdatedAt = 'UpdatedAt';

class TableQuestionKHCNProduct {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  int? sTTSanPham;
  double? c21;
  double? c22;
  String? createdAt;
  String? updatedAt;

  TableQuestionKHCNProduct({
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

  TableQuestionKHCNProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    c21 = json['C2_1'];
    c22 = json['C2_2'];

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

    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionKHCNProduct>? listFromJson(dynamic json) {
    List<TableQuestionKHCNProduct> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionKHCNProduct.fromJson(item));
      }
    }
    return list;
  }
}
