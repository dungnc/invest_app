import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionVT = 'QuestionVT';
const String questionVTId = '_id';
const String questionVTNam = 'Nam';
const String questionVTThang = 'Thang';
const String questionVTIDDonVi = 'IDDonVi';
const String questionVTMaTinh = 'MaTinh';
const String questionVTMaHuyen = 'MaHuyen';
const String questionVTMaXa = 'MaXa';
const String questionVTMaDiaBan = 'MaDiaBan';
const String questionVTMaDonVi = 'MaDonVi';
const String questionVTMaTinhTrang = 'MaTinhTrang';
const String questionVTC1_1 = 'C1_1';
const String questionVTC1_2 = 'C1_2';
const String questionVTC3_1 = 'C3_1';
const String questionVTC3_2 = 'C3_2';
const String questionVTC4_1 = 'C4_1';
const String questionVTC4_2 = 'C4_2';
const String questionVTC5 = 'C5';
const String questionVTC6_1 = 'C6_1';
const String questionVTC6_2 = 'C6_2';
const String questionVTC6_31 = 'C6_31';
const String questionVTC6_32 = 'C6_32';
const String questionVTC7_1 = 'C7_1';
const String questionVTC7_2 = 'C7_2';
const String questionVTC7_31 = 'C7_31';
const String questionVTC7_32 = 'C7_32';
const String questionVTC8_1 = 'C8_1';
const String questionVTC8_2 = 'C8_2';
const String questionVTC8_31 = 'C8_31';
const String questionVTC8_32 = 'C8_32';
const String questionVTC9_1 = 'C9_1';
const String questionVTC9_2 = 'C9_2';
const String questionVTC10_1 = 'C10_1';
const String questionVTC10_2 = 'C10_2';
const String questionVTC10_31 = 'C10_31';
const String questionVTC10_32 = 'C10_32';
const String questionVTC11_1 = 'C11_1';
const String questionVTC11_2 = 'C11_2';
const String questionVTC11_31 = 'C11_31';
const String questionVTC11_32 = 'C11_32';
const String questionVTC12_1 = 'C12_1';
const String questionVTC12_2 = 'C12_2';
const String questionVTC13_1 = 'C13_1';
const String questionVTC13_2 = 'C13_2';
const String questionVTC14 = 'C14';
const String questionVTC15_1 = 'C15_1';
const String questionVTC15_2 = 'C15_2';
const String questionVTC15_31 = 'C15_31';
const String questionVTC15_32 = 'C15_32';
const String questionVTC16_1 = 'C16_1';
const String questionVTC16_2 = 'C16_2';
const String questionVTC16_31 = 'C16_31';
const String questionVTC16_32 = 'C16_32';
const String questionVTC17_1 = 'C17_1';
const String questionVTC17_2 = 'C17_2';
const String questionVTC17_31 = 'C17_31';
const String questionVTC17_32 = 'C17_32';
const String questionVTC18_1 = 'C18_1';
const String questionVTC18_2 = 'C18_2';
const String questionVTC19_1 = 'C19_1';
const String questionVTC19_2 = 'C19_2';
const String questionVTC19_31 = 'C19_31';
const String questionVTC19_32 = 'C19_32';
const String questionVTC20_1 = 'C20_1';
const String questionVTC20_2 = 'C20_2';
const String questionVTC20_31 = 'C20_31';
const String questionVTC20_32 = 'C20_32';
const String questionVTC21 = 'C21';
const String questionVTC21GhiRo = 'C21_GhiRo';
const String questionVTMaDTV = 'MaDTV';
const String questionVTKinhdo = 'KinhDo';
const String questionVTVido = 'Vido';
const String questionVTNguoiTraLoi = 'NguoiTraLoi';
const String questionVTSoDienThoai = 'SoDienThoai';
const String questionVTThoiGianBD = 'ThoiGianBD';
const String questionVTThoiGianKT = 'ThoiGianKT';
const String questionVTCreatedAt = 'CreatedAt';
const String questionVTUpdatedAt = 'UpdatedAt';

class TableQuestionVT {
  int? id;
  int? nam;
  int? thang;
  String? iDDonVi;
  String? maTinh;
  String? maHuyen;
  String? maXa;
  String? maDiaBan;
  int? maDonVi;
  int? maTinhTrang;
  double? c11;
  double? c12;
  int? c31;
  int? c32;
  int? c41;
  int? c42;
  int? c5;
  int? c61;
  int? c62;
  int? c631;
  int? c632;
  int? c71;
  int? c72;
  int? c731;
  int? c732;
  double? c81;
  double? c82;
  double? c831;
  double? c832;
  double? c91;
  double? c92;
  int? c101;
  int? c102;
  int? c1031;
  int? c1032;
  double? c111;
  double? c112;
  double? c1131;
  double? c1132;
  int? c121;
  int? c122;
  double? c131;
  double? c132;
  int? c14;
  int? c151;
  int? c152;
  int? c1531;
  int? c1532;
  double? c161;
  double? c162;
  double? c1631;
  double? c1632;
  double? c171;
  double? c172;
  double? c1731;
  double? c1732;
  double? c181;
  double? c182;
  double? c191;
  double? c192;
  double? c1931;
  double? c1932;
  double? c201;
  double? c202;
  double? c2031;
  double? c2032;
  String? c21;
  String? c21GhiRo;
  String? maDTV;
  double? kinhdo;
  double? vido;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianBD;
  String? thoiGianKT;
  List<TableQuestionVTProduct>? cTPhieuVTASanPham;
  String? createdAt;
  String? updatedAt;

  TableQuestionVT({
    this.id,
    this.nam,
    this.thang,
    this.iDDonVi,
    this.maTinh,
    this.maHuyen,
    this.maXa,
    this.maDiaBan,
    this.maDonVi,
    this.maTinhTrang,
    this.c11,
    this.c12,
    this.c31,
    this.c32,
    this.c41,
    this.c42,
    this.c5,
    this.c61,
    this.c62,
    this.c631,
    this.c632,
    this.c71,
    this.c72,
    this.c731,
    this.c732,
    this.c81,
    this.c82,
    this.c831,
    this.c832,
    this.c91,
    this.c92,
    this.c101,
    this.c102,
    this.c1031,
    this.c1032,
    this.c111,
    this.c112,
    this.c1131,
    this.c1132,
    this.c121,
    this.c122,
    this.c131,
    this.c132,
    this.c14,
    this.c151,
    this.c152,
    this.c1531,
    this.c1532,
    this.c161,
    this.c162,
    this.c1631,
    this.c1632,
    this.c171,
    this.c172,
    this.c1731,
    this.c1732,
    this.c181,
    this.c182,
    this.c191,
    this.c192,
    this.c1931,
    this.c1932,
    this.c201,
    this.c202,
    this.c2031,
    this.c2032,
    this.c21,
    this.c21GhiRo,
    this.maDTV,
    this.kinhdo,
    this.vido,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianBD,
    this.thoiGianKT,
    this.cTPhieuVTASanPham,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionVT.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    iDDonVi = json['IDDonVi'];
    maTinh = json[questionVTMaTinh];
    maHuyen = json['MaHuyen'];
    maXa = json['MaXa'];
    maDiaBan = json['MaDiaBan'];
    maDonVi = json['MaDonVi'];
    maTinhTrang = json['MaTinhTrang'];
    c11 = json['C1_1'];
    c12 = json['C1_2'];
    c31 = json['C3_1'];
    c32 = json['C3_2'];
    c41 = json['C4_1'];
    c42 = json['C4_2'];
    c5 = json['C5'];
    c61 = json['C6_1'];
    c62 = json['C6_2'];
    c631 = json['C6_31'];
    c632 = json['C6_32'];
    c71 = json['C7_1'];
    c72 = json['C7_2'];
    c731 = json['C7_31'];
    c732 = json['C7_32'];
    c81 = json['C8_1'];
    c82 = json['C8_2'];
    c831 = json['C8_31'];
    c832 = json['C8_32'];
    c91 = json['C9_1'];
    c92 = json['C9_2'];
    c101 = json['C10_1'];
    c102 = json['C10_2'];
    c1031 = json['C10_31'];
    c1032 = json['C10_32'];
    c111 = json['C11_1'];
    c112 = json['C11_2'];
    c1131 = json['C11_31'];
    c1132 = json['C11_32'];
    c121 = json['C12_1'];
    c122 = json['C12_2'];
    c131 = json['C13_1'];
    c132 = json['C13_2'];
    c14 = json['C14'];
    c151 = json['C15_1'];
    c152 = json['C15_2'];
    c1531 = json['C15_31'];
    c1532 = json['C15_32'];
    c161 = json['C16_1'];
    c162 = json['C16_2'];
    c1631 = json['C16_31'];
    c1632 = json['C16_32'];
    c171 = json['C17_1'];
    c172 = json['C17_2'];
    c1731 = json['C17_31'];
    c1732 = json['C17_32'];
    c181 = json['C18_1'];
    c182 = json['C18_2'];
    c191 = json['C19_1'];
    c192 = json['C19_2'];
    c1931 = json['C19_31'];
    c1932 = json['C19_32'];
    c201 = json['C20_1'];
    c202 = json['C20_2'];
    c2031 = json['C20_31'];
    c2032 = json['C20_32'];
    c21 = json['C21'];
    c21GhiRo = json['C21_GhiRo'];
    maDTV = json['MaDTV'];
    kinhdo = json['Kinhdo'];
    vido = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianBD = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];

    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['IDDonVi'] = iDDonVi;
    data[questionVTMaTinh] = maTinh;
    data['MaHuyen'] = maHuyen;
    data['MaXa'] = maXa;
    data['MaDiaBan'] = maDiaBan;
    data['MaDonVi'] = maDonVi;
    data['MaTinhTrang'] = maTinhTrang;
    data['C1_1'] = c11;
    data['C1_2'] = c12;
    data['C3_1'] = c31;
    data['C3_2'] = c32;
    data['C4_1'] = c41;
    data['C4_2'] = c42;
    data['C5'] = c5;
    data['C6_1'] = c61;
    data['C6_2'] = c62;
    data['C6_31'] = c631;
    data['C6_32'] = c632;
    data['C7_1'] = c71;
    data['C7_2'] = c72;
    data['C7_31'] = c731;
    data['C7_32'] = c732;
    data['C8_1'] = c81;
    data['C8_2'] = c82;
    data['C8_31'] = c831;
    data['C8_32'] = c832;
    data['C9_1'] = c91;
    data['C9_2'] = c92;
    data['C10_1'] = c101;
    data['C10_2'] = c102;
    data['C10_31'] = c1031;
    data['C10_32'] = c1032;
    data['C11_1'] = c111;
    data['C11_2'] = c112;
    data['C11_31'] = c1131;
    data['C11_32'] = c1132;
    data['C12_1'] = c121;
    data['C12_2'] = c122;
    data['C13_1'] = c131;
    data['C13_2'] = c132;
    data['C14'] = c14;
    data['C15_1'] = c151;
    data['C15_2'] = c152;
    data['C15_31'] = c1531;
    data['C15_32'] = c1532;
    data['C16_1'] = c161;
    data['C16_2'] = c162;
    data['C16_31'] = c1631;
    data['C16_32'] = c1632;
    data['C17_1'] = c171;
    data['C17_2'] = c172;
    data['C17_31'] = c1731;
    data['C17_32'] = c1732;
    data['C18_1'] = c181;
    data['C18_2'] = c182;
    data['C19_1'] = c191;
    data['C19_2'] = c192;
    data['C19_31'] = c1931;
    data['C19_32'] = c1932;
    data['C20_1'] = c201;
    data['C20_2'] = c202;
    data['C20_31'] = c2031;
    data['C20_32'] = c2032;
    data['C21'] = c21;
    data['C21_GhiRo'] = c21GhiRo;
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

  static List<TableQuestionVT>? listFromJson(dynamic json) {
    List<TableQuestionVT> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionVT.fromJson(item));
      }
    }
    return list;
  }
}
