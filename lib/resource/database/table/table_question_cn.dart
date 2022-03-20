import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionCN = 'QuestionCN';
const String questionCNId = '_id';
const String questionCNNam = 'Nam';
const String questionCNThang = 'Thang';
const String questionCNIDDonVi = 'IDDonVi';
const String questionCNMaTinh = 'MaTinh';
const String questionCNMaHuyen = 'MaHuyen';
const String questionCNMaXa = 'MaXa';
const String questionCNMaDiaBan = 'MaDiaBan';
const String questionCNMaDonVi = 'MaDonVi';
const String questionCNMaTinhTrangHD = 'MaTinhTrangHD';
const String questionCNC1_1 = 'C1_1';
const String questionCNC1_2 = 'C1_2';
const String questionCNC = 'C';
const String questionCNMaDTV = 'MaDTV';
const String questionCNKinhDo = 'Kinhdo';
const String questionCNViDo = 'Vido';
const String questionCNNguoiTraLoi = 'NguoiTraLoi';
const String questionCNSoDienThoai = 'SoDienThoai';
const String questionCNThoiGianDB = 'ThoiGianBD';
const String questionCNThoiGianKT = 'ThoiGianKT';
const String questionCNCreatedAt = 'CreatedAt';
const String questionCNUpdatedAt = 'UpdatedAt';

class TableQuestionCN {
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
  double? c1_1;
  double? c1_2;
  String? c;
  String? maDTV;
  double? kinhDo;
  double? viDo;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianDB;
  String? thoiGianKT;
  List<TableQuestionCNProduct>? ctPhieuCnSanPham;
  String? createdAt;
  String? updatedAt;

  TableQuestionCN({
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
    this.c1_1,
    this.c1_2,
    this.c,
    this.maDTV,
    this.kinhDo,
    this.viDo,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianDB,
    this.thoiGianKT,
    this.ctPhieuCnSanPham,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionCN.fromJson(dynamic json) {
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
    c1_1 = json['C1_1'];
    c1_2 = json['C1_2'];
    c = json['C'];
    maDTV = json['MaDTV'];
    kinhDo = json['Kinhdo'];
    viDo = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianDB = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];
    ctPhieuCnSanPham =
        TableQuestionCNProduct.fromListJson(json['CT_Phieu_CN_SanPham']);
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    var map = <String, Object?>{};
    map['Nam'] = nam;
    map['Thang'] = thang;
    map['IDDonVi'] = iDDonVi;
    map['MaTinh'] = maTinh;
    map['MaHuyen'] = maHuyen;
    map['MaXa'] = maXa;
    map['MaDiaBan'] = maDiaBan;
    map['MaDonVi'] = maDonVi;
    map['MaTinhTrangHD'] = maTinhTrangHD;
    map['C1_1'] = c1_1;
    map['C1_2'] = c1_2;
    map['C'] = c;
    map['MaDTV'] = maDTV;
    map['Kinhdo'] = kinhDo;
    map['Vido'] = viDo;
    map['NguoiTraLoi'] = nguoiTraLoi;
    map['SoDienThoai'] = soDienThoai;
    map['ThoiGianBD'] = thoiGianDB;
    map['ThoiGianKT'] = thoiGianKT;
    map['CreatedAt'] = createdAt;
    map['UpdatedAt'] = updatedAt;
    return map;
  }

  static List<TableQuestionCN>? listFromJson(dynamic json) {
    List<TableQuestionCN> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionCN.fromJson(item));
      }
    }
    return list;
  }
}
