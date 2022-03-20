import 'package:statistical_survey/resource/database/database.dart';

const String tableBusinessPremises = 'BusinessPremises';
const String businessPremisesId = '_id';
const String businessPremisesNam = 'Nam';
const String businessPremisesThang = 'Thang';
const String businessPremisesQuy = 'Quy';
const String businessPremisesIDDonVi = 'IDDonVi';
const String businessPremisesMaTinh = 'MaTinh';
const String businessPremisesTenTinh = 'TenTinh';
const String businessPremisesMaHuyen = 'MaHuyen';
const String businessPremisesTenHuyen = 'TenHuyen';
const String businessPremisesMaXa = 'MaXa';
const String businessPremisesTenXa = 'TenXa';
const String businessPremisesMaDiaBan = 'MaDiaBan';
const String businessPremisesTenDiaBan = 'TenDiaBan';
const String businessPremisesMaDonVi = 'MaDonVi';
const String businessPremisesTenDonVi = 'TenDonVi';
const String businessPremisesMaSoThue = 'MaSoThue';
const String businessPremisesDiaChi = 'DiaChi';
const String businessPremisesMaDiaDiem = 'MaDiaDiem';
const String businessPremisesTenDiaDiem = 'TenDiaDiem';
const String businessPremisesDienThoai = 'DienThoai';
const String businessPremisesMaTinhTrangHD = 'MaTinhTrangHD';
const String businessPremisesMauThang = 'MauThang';
const String businessPremisesMauQuy = 'MauQuy';
const String businessPremisesMauHH = 'MauHH';
const String businessPremisesMauDVLA = 'MauDVLA';
const String businessPremisesMauDVDVK = 'MauDVDVK';
const String businessPremisesMauDVKHCN = 'MauDVKHCN';
const String businessPremisesMauBoSung = 'MauBoSung';
const String businessPremisesTenNguoiCungCap = 'TenNguoiCungCap';
const String businessPremisesSDTNguoiCungCap = 'SDTNguoiCungCap';
const String businessPremisesMaDTV = 'MaDTV';
const String businessPremisesMaTrangThaiDT = 'MaTrangThaiDT';
const String businessPremisesCreatedAt = 'CreatedAt';
const String businessPremisesUpdatedAt = 'UpdatedAt';

class TableBusinessPremises {
  int? id;
  int? nam;
  int? thang;
  int? quy;
  String? iDDonVi;
  String? maTinh;
  String? tenTinh;
  String? maHuyen;
  String? tenHuyen;
  String? maXa;
  String? tenXa;
  String? maDiaBan;
  String? tenDiaBan;
  int? maDonVi;
  String? tenDonVi;
  String? maSoThue;
  String? diaChi;
  int? maDiaDiem;
  String? tenDiaDiem;
  String? dienThoai;
  int? maTinhTrangHD;
  bool? mauThang;
  bool? mauQuy;
  int? mauHH;
  int? mauDVLA;
  int? mauDVDVK;
  int? mauDVKHCN;
  bool? mauBoSung;
  String? tenNguoiCungCap;
  String? sDTNguoiCungCap;
  String? maDTV;
  int? maTrangThaiDT;
  List<TableProduct>? products;
  String? createdAt;
  String? updatedAt;

  TableBusinessPremises({
    this.id,
    this.nam,
    this.thang,
    this.quy,
    this.iDDonVi,
    this.maTinh,
    this.tenTinh,
    this.maHuyen,
    this.tenHuyen,
    this.maXa,
    this.tenXa,
    this.maDiaBan,
    this.tenDiaBan,
    this.maDonVi,
    this.tenDonVi,
    this.maSoThue,
    this.diaChi,
    this.maDiaDiem,
    this.tenDiaDiem,
    this.dienThoai,
    this.maTinhTrangHD,
    this.mauThang,
    this.mauQuy,
    this.mauHH,
    this.mauDVLA,
    this.mauDVDVK,
    this.mauDVKHCN,
    this.mauBoSung,
    this.tenNguoiCungCap,
    this.sDTNguoiCungCap,
    this.maDTV,
    this.maTrangThaiDT,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  TableBusinessPremises.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nam = json['Nam'];
    thang = json['Thang'];
    quy = json['Quy'];
    iDDonVi = json['IDDonVi'];
    maTinh = json['MaTinh'];
    tenTinh = json['TenTinh'];
    maHuyen = json['MaHuyen'];
    tenHuyen = json['TenHuyen'];
    maXa = json['MaXa'];
    tenXa = json['TenXa'];
    maDiaBan = json['MaDiaBan'];
    tenDiaBan = json['TenDiaBan'];
    maDonVi = json['MaDonVi'];
    tenDonVi = json['TenDonVi'];
    maSoThue = json['MaSoThue'];
    diaChi = json['DiaChi'];
    maDiaDiem = json['MaDiaDiem'];
    tenDiaDiem = json['TenDiaDiem'];
    dienThoai = json['DienThoai'];
    maTinhTrangHD = json['MaTinhTrangHD'];
    mauThang = json['MauThang'] == 1 ? true : false;
    mauQuy = json['MauQuy'] == 1 ? true : false;
    mauHH = json['MauHH'];
    mauDVLA = json['MauDVLA'];
    mauDVDVK = json['MauDVDVK'];
    mauDVKHCN = json['MauDVKHCN'];
    mauBoSung = json['MauBoSung'] == 1 ? true : false;
    tenNguoiCungCap = json['TenNguoiCungCap'];
    sDTNguoiCungCap = json['SDTNguoiCungCap'];
    maDTV = json['MaDTV'];
    maTrangThaiDT = json['MaTrangThaiDT'];
    products = TableProduct.listFromJson(json['DanhSachCoSoSXKD_SanPham']);
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['Quy'] = quy;
    data['IDDonVi'] = iDDonVi;
    data['MaTinh'] = maTinh;
    data['TenTinh'] = tenTinh;
    data['MaHuyen'] = maHuyen;
    data['TenHuyen'] = tenHuyen;
    data['MaXa'] = maXa;
    data['TenXa'] = tenXa;
    data['MaDiaBan'] = maDiaBan;
    data['TenDiaBan'] = tenDiaBan;
    data['MaDonVi'] = maDonVi;
    data['TenDonVi'] = tenDonVi;
    data['MaSoThue'] = maSoThue;
    data['DiaChi'] = diaChi;
    data['MaDiaDiem'] = maDiaDiem;
    data['TenDiaDiem'] = tenDiaDiem;
    data['DienThoai'] = dienThoai;
    data['MaTinhTrangHD'] = maTinhTrangHD;
    data['MauThang'] = mauThang;
    data['MauQuy'] = mauQuy;
    data['MauHH'] = mauHH;
    data['MauDVLA'] = mauDVLA;
    data['MauDVDVK'] = mauDVDVK;
    data['MauDVKHCN'] = mauDVKHCN;
    data['MauBoSung'] = mauBoSung;
    data['TenNguoiCungCap'] = tenNguoiCungCap;
    data['SDTNguoiCungCap'] = sDTNguoiCungCap;
    data['MaDTV'] = maDTV;
    data['MaTrangThaiDT'] = maTrangThaiDT;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  Map<String, Object?> toJsonWithConvertBool() {
    final data = <String, Object?>{};
    data['Nam'] = nam;
    data['Thang'] = thang;
    data['Quy'] = quy;
    data['IDDonVi'] = iDDonVi;
    data['MaTinh'] = maTinh;
    data['TenTinh'] = tenTinh;
    data['MaHuyen'] = maHuyen;
    data['TenHuyen'] = tenHuyen;
    data['MaXa'] = maXa;
    data['TenXa'] = tenXa;
    data['MaDiaBan'] = maDiaBan;
    data['TenDiaBan'] = tenDiaBan;
    data['MaDonVi'] = maDonVi;
    data['TenDonVi'] = tenDonVi;
    data['MaSoThue'] = maSoThue;
    data['DiaChi'] = diaChi;
    data['MaDiaDiem'] = maDiaDiem;
    data['TenDiaDiem'] = tenDiaDiem;
    data['DienThoai'] = dienThoai;
    data['MaTinhTrangHD'] = maTinhTrangHD;
    data['MauThang'] = mauThang != null
        ? mauThang!
            ? 1
            : 0
        : 0;
    data['MauQuy'] = mauQuy != null
        ? mauQuy!
            ? 1
            : 0
        : 0;
    data['MauHH'] = mauHH;
    data['MauDVLA'] = mauDVLA;
    data['MauDVDVK'] = mauDVDVK;
    data['MauDVKHCN'] = mauDVKHCN;
    data['MauBoSung'] = mauBoSung != null
        ? mauBoSung!
            ? 1
            : 0
        : 0;
    data['TenNguoiCungCap'] = tenNguoiCungCap;
    data['SDTNguoiCungCap'] = sDTNguoiCungCap;
    data['MaDTV'] = maDTV;
    data['MaTrangThaiDT'] = maTrangThaiDT;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    return data;
  }

  static List<TableBusinessPremises>? listFromJson(dynamic json) {
    List<TableBusinessPremises> list = [];
    if (json != null) {
      for (var item in json) {
        list.add(TableBusinessPremises.fromJson(item));
      }
    }
    return list;
  }
}
