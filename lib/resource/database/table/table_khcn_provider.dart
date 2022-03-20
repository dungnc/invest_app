import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionKHCN = 'QuestionKHCN';
const String questionKHCNId = '_id';
const String questionKHCNNam = 'Nam';
const String questionKHCNThang = 'Thang';
const String questionKHCNIDDonVi = 'IDDonVi';
const String questionKHCNMaTinh = 'MaTinh';
const String questionKHCNMaHuyen = 'MaHuyen';
const String questionKHCNMaXa = 'MaXa';
const String questionKHCNMaDiaBan = 'MaDiaBan';
const String questionKHCNMaDonVi = 'MaDonVi';
const String questionKHCNMaTinhTrangHD = 'MaTinhTrangHD';
const String questionKHCNC11 = 'C1_1';
const String questionKHCNC12 = 'C1_2';
const String questionKHCNC3 = 'C3';
const String questionKHCNC3GhiRo = 'C3_GhiRo';
const String questionKHCNMaDTV = 'MaDTV';
const String questionKHCNKinhDo = 'KinhDo';
const String questionKHCNViDo = 'ViDo';
const String questionKHCNNguoiTraLoi = 'NguoiTraLoi';
const String questionKHCNSoDienThoai = 'SoDienThoai';
const String questionKHCNThoiGianBD = 'ThoiGianBD';
const String questionKHCNThoiGianKT = 'ThoiGianKT';
const String questionKHCNCreatedAt = 'CreatedAt';
const String questionKHCNUpdatedAt = 'UpdatedAt';

class TableQuestionKHCN {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  String? maDiaBan;
  int? maDonVi;
  int? maTinhTrangHD;
  double? c11;
  double? c12;
  String? c3;
  String? c3GhiRo;
  String? maDTV;
  double? kinhdo;
  double? vido;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianBD;
  String? thoiGianKT;
  List<TableQuestionKHCNProduct>? cTPhieuKHCNSanPham;
  String? createdAt;
  String? updatedAt;

  TableQuestionKHCN({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.maTinh,
    this.maHuyen,
    this.maXa,
    this.maDiaBan,
    this.maDonVi,
    this.maTinhTrangHD,
    this.c11,
    this.c12,
    this.c3,
    this.c3GhiRo,
    this.maDTV,
    this.kinhdo,
    this.vido,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianBD,
    this.thoiGianKT,
    this.cTPhieuKHCNSanPham,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionKHCN.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    maTinh = json['MaTinh'];
    maHuyen = json['MaHuyen'];
    maXa = json['MaXa'];
    maDiaBan = json['MaDiaBan'];
    maDonVi = json['MaDonVi'];
    maTinhTrangHD = json['MaTinhTrangHD'];
    c11 = json['C1_1'];
    c12 = json['C1_2'];
    c3 = json['C3'];
    c3GhiRo = json['C3_GhiRo'];
    maDTV = json['MaDTV'];
    kinhdo = json['Kinhdo'];
    vido = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianBD = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];
    cTPhieuKHCNSanPham =
        TableQuestionKHCNProduct.listFromJson(json['CT_Phieu_DV_KHCN_SanPham']);
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['IDDonVi'] = iDDonVi;
    data['MaTinh'] = maTinh;
    data['MaHuyen'] = maHuyen;
    data['MaXa'] = maXa;
    data['MaDiaBan'] = maDiaBan;
    data['MaDonVi'] = maDonVi;
    data['MaTinhTrangHD'] = maTinhTrangHD;
    data['C1_1'] = c11;
    data['C1_2'] = c12;
    data['C3'] = c3;
    data['C3_GhiRo'] = c3GhiRo;
    data['MaDTV'] = maDTV;
    data['Kinhdo'] = kinhdo;
    data['Vido'] = vido;
    data['NguoiTraLoi'] = nguoiTraLoi;
    data['SoDienThoai'] = soDienThoai;
    data['ThoiGianBD'] = thoiGianBD;
    data['ThoiGianKT'] = thoiGianKT;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableQuestionKHCN>? listFromJson(dynamic json) {
    List<TableQuestionKHCN> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionKHCN.fromJson(item));
      }
    }
    return list;
  }
}
