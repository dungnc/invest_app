import 'package:statistical_survey/resource/database/database.dart';

const String tableProduct = 'Product';
const String productId = '_id';
const String productNam = 'Nam';
const String productThang = 'Thang';
const String productQuy = 'Quy';
const String productIDDonVi = 'IDDonVi';
const String productSTTSanPham = 'STT_SanPham';
const String productMaSanPham = 'MaSanPham';
const String productTenSanPham = 'TenSanPham';
const String productDonViTinh = 'DonViTinh';
const String productDoanhThuBinhQuan = 'DoanhThuBinhQuan';
const String productMaPhieu = 'MaPhieu';
const String productTenPhieu = 'TenPhieu';
const String productBangDuLieuPhieu = 'BangDuLieuPhieu';
const String productGhiChuPhieu = 'GhiChuPhieu';
const String productCreatedAt = 'CreatedAt';
const String productUpdatedAt = 'UpdatedAt';

class TableProduct {
  int? id;
  int? nam;
  int? thang;
  int? quy;
  String? iDDonVi;
  int? sTTSanPham;
  String? maSanPham;
  String? tenSanPham;
  String? donViTinh;
  double? doanhThuBinhQuan;
  // Null? maSanPhamC5;
  // Null? maSanPhamC2;
  // Null? sTTSanPhamThayThe;
  int? maPhieu;
  String? tenPhieu;
  String? bangDuLieuPhieu;
  String? ghiChuPhieu;
  TableQuestionHH? cTPhieuHH;
  TableQuestionDVLA? cTPhieuDVLA;
  TableQuestionVT? cTPhieuVT;
  TableQuestionCN? cTPhieuCN;
  TableQuestionDVK? cTPhieuDVK;
  TableQuestionKHCN? cTPhieuKHCN;

  String? createdAt;
  String? updatedAt;

  TableProduct({
    this.id,
    this.nam,
    this.thang,
    this.quy,
    this.iDDonVi,
    this.sTTSanPham,
    this.maSanPham,
    this.tenSanPham,
    this.donViTinh,
    this.doanhThuBinhQuan,
    // this.maSanPhamC5,
    // this.maSanPhamC2,
    // this.sTTSanPhamThayThe,
    this.maPhieu,
    this.tenPhieu,
    this.bangDuLieuPhieu,
    this.ghiChuPhieu,
    this.cTPhieuDVK,
    this.createdAt,
    this.updatedAt,
  });

  TableProduct.fromJson(dynamic json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    quy = json['Quy'];
    iDDonVi = json['IDDonVi'];
    sTTSanPham = json['STT_SanPham'];
    maSanPham = json['MaSanPham'];
    tenSanPham = json['TenSanPham'];
    donViTinh = json['DonViTinh'];
    doanhThuBinhQuan = json['DoanhThuBinhQuan'];
    // maSanPhamC5 = json['MaSanPhamC5'];
    // maSanPhamC2 = json['MaSanPhamC2'];
    // sTTSanPhamThayThe = json['STT_SanPhamThayThe'];
    maPhieu = json['MaPhieu'];
    tenPhieu = json['TenPhieu'];
    bangDuLieuPhieu = json['BangDuLieuPhieu'];
    ghiChuPhieu = json['GhiChuPhieu'];
    cTPhieuHH = json['CT_Phieu_HH'] != null
        ? TableQuestionHH.fromJson(json['CT_Phieu_HH'])
        : null;
    cTPhieuDVLA = json['CT_Phieu_DV_LA'] != null
        ? TableQuestionDVLA.fromJson(json['CT_Phieu_DV_LA'])
        : null;
    cTPhieuVT = json['CT_Phieu_VT'] != null
        ? TableQuestionVT.fromJson(json['CT_Phieu_VT'])
        : null;
    cTPhieuCN = json['CT_Phieu_CN'] != null
        ? TableQuestionCN.fromJson(json['CT_Phieu_CN'])
        : null;
    cTPhieuDVK = json['CT_Phieu_DV_DVK'] != null
        ? TableQuestionDVK.fromJson(json['CT_Phieu_DV_DVK'])
        : null;
    cTPhieuKHCN = json['CT_Phieu_DV_KHCN'] != null
        ? TableQuestionKHCN.fromJson(json['CT_Phieu_DV_KHCN'])
        : null;
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['Quy'] = quy;
    data['IDDonVi'] = iDDonVi;
    data['STT_SanPham'] = sTTSanPham;
    data['MaSanPham'] = maSanPham;
    data['TenSanPham'] = tenSanPham;
    data['DonViTinh'] = donViTinh;
    data['DoanhThuBinhQuan'] = doanhThuBinhQuan;

    data['MaPhieu'] = maPhieu;
    data['TenPhieu'] = tenPhieu;
    data['BangDuLieuPhieu'] = bangDuLieuPhieu;
    data['GhiChuPhieu'] = ghiChuPhieu;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableProduct>? listFromJson(dynamic json) {
    List<TableProduct> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableProduct.fromJson(item));
      }
    }
    return list;
  }
}
