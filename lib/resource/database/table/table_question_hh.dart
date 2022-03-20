import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionHH = 'QuestionHH';
const String questionHHId = '_id';
const String questionHHNam = 'Nam';
const String questionHHThang = 'Thang';
const String questionHHIDDonVi = 'IDDonVi';
const String questionHHMaTinh = 'MaTinh';
const String questionHHMaHuyen = 'MaHuyen';
const String questionHHMaXa = 'MaXa';
const String questionHHMaDiaBan = 'MaDiaBan';
const String questionHHMaDonVi = 'MaDonVi';
const String questionHHMaTinhTrangHD = 'MaTinhTrangHD';
const String questionHHC11 = 'C1_1';
const String questionHHC12 = 'C1_2';
const String questionHHC13 = 'C1_3';
const String questionHHC4 = 'C4';
const String questionHHC4GhiRo = 'C4_GhiRo';
const String questionHHMaDTV = 'MaDTV';
const String questionHHKinhDo = 'KinhDo';
const String questionHHViDo = 'ViDo';
const String questionHHNguoiTraLoi = 'NguoiTraLoi';
const String questionHHSoDienThoai = 'SoDienThoai';
const String questionHHThoiGianBD = 'ThoiGianBD';
const String questionHHThoiGianKT = 'ThoiGianKT';
const String questionHHCreatedAt = 'CreatedAt';
const String questionHHUpdatedAt = 'UpdatedAt';

class TableQuestionHH {
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
  double? c13;
  String? c4;
  String? c4GhiRo;
  String? maDTV;
  double? kinhdo;
  double? vido;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianBD;
  String? thoiGianKT;
  List<TableQuestionHHProduct>? cTPhieuHHSanPham;
  String? createdAt;
  String? updatedAt;

  TableQuestionHH({
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
    this.c13,
    this.c4,
    this.c4GhiRo,
    this.maDTV,
    this.kinhdo,
    this.vido,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianBD,
    this.thoiGianKT,
    this.cTPhieuHHSanPham,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionHH.fromJson(dynamic json) {
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
    c13 = json['C1_3'];
    c4 = json['C4'];
    c4GhiRo = json['C4_GhiRo'];
    maDTV = json['MaDTV'];
    kinhdo = json['Kinhdo'];
    vido = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianBD = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];
    cTPhieuHHSanPham =
        TableQuestionHHProduct.listFromJson(json['CT_Phieu_HH_SanPham']);
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
    data['C1_3'] = c13;
    data['C4'] = c4;
    data['C4_GhiRo'] = c4GhiRo;
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

  static List<TableQuestionHH>? listFromJson(dynamic json) {
    List<TableQuestionHH> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionHH.fromJson(item));
      }
    }
    return list;
  }
}
