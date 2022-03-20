import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionDVLA = 'QuestionDVLA';
const String questionDVLAId = '_id';
const String questionDVLANam = 'Nam';
const String questionDVLAThang = 'Thang';
const String questionDVLAIDDonVi = 'IDDonVi';
const String questionDVLAMaTinh = 'MaTinh';
const String questionDVLAMaHuyen = 'MaHuyen';
const String questionDVLAMaXa = 'MaXa';
const String questionDVLAMaDiaBan = 'MaDiaBan';
const String questionDVLAMaDonVi = 'MaDonVi';
const String questionDVLAMaTinhTrangHD = 'MaTinhTrangHD';
const String questionDVLAC1_1 = 'C1_1';
const String questionDVLAC1_2 = 'C1_2';
const String questionDVLAC4_1 = 'C4_1';
const String questionDVLAC4_2 = 'C4_2';
const String questionDVLAC4_31 = 'C4_31';
const String questionDVLAC4_32 = 'C4_32';
const String questionDVLAC5_1 = 'C5_1';
const String questionDVLAC5_2 = 'C5_2';
const String questionDVLAC6_1 = 'C6_1';
const String questionDVLAC6_2 = 'C6_2';
const String questionDVLAC7_1 = 'C7_1';
const String questionDVLAC7_2 = 'C7_2';
const String questionDVLAC7_31 = 'C7_31';
const String questionDVLAC7_32 = 'C7_32';
const String questionDVLAC8_1 = 'C8_1';
const String questionDVLAC8_2 = 'C8_2';
const String questionDVLAC9_1 = 'C9_1';
const String questionDVLAC9_2 = 'C9_2';
const String questionDVLAC10 = 'C10';
const String questionDVLAC10GhiRo = 'C10_GhiRo';
const String questionDVLAMaDTV = 'MaDTV';
const String questionDVLAKinhdo = 'Kinhdo';
const String questionDVLAVido = 'Vido';
const String questionDVLANguoiTraLoi = 'NguoiTraLoi';
const String questionDVLASoDienThoai = 'SoDienThoai';
const String questionDVLAThoiGianBD = 'ThoiGianBD';
const String questionDVLAThoiGianKT = 'ThoiGianKT';
const String questionDVLACreatedAt = 'CreatedAt';
const String questionDVLAUpdatedAt = 'UpdatedAt';

class TableQuestionDVLA {
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
  int? c41;
  int? c42;
  int? c431;
  int? c432;
  int? c51;
  int? c52;
  int? c61;
  int? c62;
  int? c71;
  int? c72;
  int? c731;
  int? c732;
  int? c81;
  int? c82;
  int? c91;
  int? c92;
  int? c10;
  String? c10GhiRo;
  String? maDTV;
  double? kinhdo;
  double? vido;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianBD;
  String? thoiGianKT;
  String? createdAt;
  String? updatedAt;
  List<TableQuestionDVLAProduct>? cTPhieuDVLASanPham;

  TableQuestionDVLA({
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
    this.c41,
    this.c42,
    this.c431,
    this.c432,
    this.c51,
    this.c52,
    this.c61,
    this.c62,
    this.c71,
    this.c72,
    this.c731,
    this.c732,
    this.c81,
    this.c82,
    this.c91,
    this.c92,
    this.c10,
    this.c10GhiRo,
    this.maDTV,
    this.kinhdo,
    this.vido,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianBD,
    this.thoiGianKT,
    this.createdAt,
    this.updatedAt,
    this.cTPhieuDVLASanPham,
  });

  TableQuestionDVLA.fromJson(dynamic json) {
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
    c41 = json['C4_1'];
    c42 = json['C4_2'];
    c431 = json['C4_31'];
    c432 = json['C4_32'];
    c51 = json['C5_1'];
    c52 = json['C5_2'];
    c61 = json['C6_1'];
    c62 = json['C6_2'];
    c71 = json['C7_1'];
    c72 = json['C7_2'];
    c731 = json['C7_31'];
    c732 = json['C7_32'];
    c81 = json['C8_1'];
    c82 = json['C8_2'];
    c91 = json['C9_1'];
    c92 = json['C9_2'];
    c10 = json['C10'];
    c10GhiRo = json['C10_GhiRo'];
    maDTV = json['MaDTV'];
    kinhdo = json['Kinhdo'];
    vido = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianBD = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];
    cTPhieuDVLASanPham =
        TableQuestionDVLAProduct.listFromJson(json['CT_Phieu_DV_LA_SanPham']);
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
    data['C4_1'] = c41;
    data['C4_2'] = c42;
    data['C4_31'] = c431;
    data['C4_32'] = c432;
    data['C5_1'] = c51;
    data['C5_2'] = c52;
    data['C6_1'] = c61;
    data['C6_2'] = c62;
    data['C7_1'] = c71;
    data['C7_2'] = c72;
    data['C7_31'] = c731;
    data['C7_32'] = c732;
    data['C8_1'] = c81;
    data['C8_2'] = c82;
    data['C9_1'] = c91;
    data['C9_2'] = c92;
    data['C10'] = c10;
    data['C10_GhiRo'] = c10GhiRo;
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

  static List<TableQuestionDVLA>? listFromJson(dynamic json) {
    List<TableQuestionDVLA> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionDVLA.fromJson(item));
      }
    }
    return list;
  }
}
