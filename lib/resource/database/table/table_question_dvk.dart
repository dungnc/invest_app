import 'package:statistical_survey/resource/database/database.dart';

const String tableQuestionDVK = 'QuestionDVK';
const String questionDVKId = '_id';
const String questionDVKNam = 'Nam';
const String questionDVKThang = 'Thang';
const String questionDVKIDDonVi = 'IDDonVi';
const String questionDVKMaTinh = 'MaTinh';
const String questionDVKMaHuyen = 'MaHuyen';
const String questionDVKMaXa = 'MaXa';
const String questionDVKMaDiaBan = 'MaDiaBan';
const String questionDVKMaDonVi = 'MaDonVi';
const String questionDVKMaTinhTrangHD = 'MaTinhTrangHD';
const String questionDVKC11 = 'C1_1';
const String questionDVKC12 = 'C1_2';
const String questionDVKC5 = 'C5';
const String questionDVKC5GhiRo = 'C5_GhiRo';
const String questionDVKMaDTV = 'MaDTV';
const String questionDVKKinhDo = 'KinhDo';
const String questionDVKViDo = 'ViDo';
const String questionDVKNguoiTraLoi = 'NguoiTraLoi';
const String questionDVKSoDienThoai = 'SoDienThoai';
const String questionDVKThoiGianBD = 'ThoiGianBD';
const String questionDVKThoiGianKT = 'ThoiGianKT';
const String questionDVKCreatedAt = 'CreatedAt';
const String questionDVKUpdatedAt = 'UpdatedAt';

class TableQuestionDVK {
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
  String? c5;
  String? c5GhiRo;
  String? maDTV;
  double? kinhdo;
  double? vido;
  String? nguoiTraLoi;
  String? soDienThoai;
  String? thoiGianBD;
  String? thoiGianKT;
  List<TableQuestionDVKProduct>? cTPhieuDVKSanPham;
  String? createdAt;
  String? updatedAt;

  TableQuestionDVK({
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
    this.c5,
    this.c5GhiRo,
    this.maDTV,
    this.kinhdo,
    this.vido,
    this.nguoiTraLoi,
    this.soDienThoai,
    this.thoiGianBD,
    this.thoiGianKT,
    this.cTPhieuDVKSanPham,
    this.createdAt,
    this.updatedAt,
  });

  TableQuestionDVK.fromJson(dynamic json) {
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
    c5 = json['C5'];
    c5GhiRo = json['C5_GhiRo'];
    maDTV = json['MaDTV'];
    kinhdo = json['Kinhdo'];
    vido = json['Vido'];
    nguoiTraLoi = json['NguoiTraLoi'];
    soDienThoai = json['SoDienThoai'];
    thoiGianBD = json['ThoiGianBD'];
    thoiGianKT = json['ThoiGianKT'];
    cTPhieuDVKSanPham =
        TableQuestionDVKProduct.listFromJson(json['CT_Phieu_DV_DVK_SanPham']);
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
    data['C5'] = c5;
    data['C5_GhiRo'] = c5GhiRo;
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

  static List<TableQuestionDVK>? listFromJson(dynamic json) {
    List<TableQuestionDVK> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableQuestionDVK.fromJson(item));
      }
    }
    return list;
  }
}
