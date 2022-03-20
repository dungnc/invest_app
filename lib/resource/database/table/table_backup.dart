const String tableBackup = 'BackUp';
const String backupId = '_id';
const String backupMaDangNhap = 'MaDangNhap';
const String backupTenNguoiDung = 'TenNguoiDung';
const String backupMatKhau = 'MatKhau';
const String backupMaTinh = 'MaTinh';
const String backupMaPBCC = 'MaPBCC';
const String backupDiaChi = 'DiaChi';
const String backupSDT = 'SDT';
const String backupGhiChu = 'GhiChu';
const String backupNgayCapNhat = 'NgayCapNhat';
const String backupActive = 'Active';
const String backupCreatedAt = 'CreatedAt';
const String backupUpdatedAt = 'UpdatedAt';
const String backupIsSuccess = 'IsSuccess';

class TableBackup {
  int? id;
  String? maDangNhap;
  String? tenNguoiDung;
  String? matKhau;
  String? maTinh;
  String? maPBCC;
  String? diaChi;
  String? sdt;
  String? ghiChu;
  String? ngayCapNhat;
  bool? active;
  String? createdAt;
  String? updatedAt;
  bool? isSuccess;

  TableBackup({
    this.id,
    this.maDangNhap,
    this.matKhau,
    this.maTinh,
    this.maPBCC,
    this.diaChi,
    this.sdt,
    this.ghiChu,
    this.ngayCapNhat,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.isSuccess,
  });

  TableBackup.fromJson(dynamic json) {
    id = json['_id'];
    maDangNhap = json['MaDangNhap'];
    tenNguoiDung = json['TenNguoiDung'];
    matKhau = json['MatKhau'];
    maTinh = json['MaTinh'];
    maPBCC = json['MaPBCC'];
    diaChi = json['DiaChi'];
    sdt = json['SDT'];
    ghiChu = json['GhiChu'];
    ngayCapNhat = json['NgayCapNhat'];
    active = json['Active'] is int
        ? json['Active'] == 1
            ? true
            : false
        : json['Active'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    isSuccess = json['IsSuccess'] is int
        ? json['IsSuccess'] == 1
            ? true
            : false
        : json['IsSuccess'];
  }

  Map toJson() {
    var map = <String, dynamic>{};
    map['MaDangNhap'] = maDangNhap;
    map['TenNguoiDung'] = tenNguoiDung;
    map['MatKhau'] = matKhau;
    map['MaTinh'] = maTinh;
    map['MaPBCC'] = maPBCC;
    map['DiaChi'] = diaChi;
    map['SDT'] = sdt;
    map['GhiChu'] = ghiChu;
    map['NgayCapNhat'] = ngayCapNhat;
    map['Active'] = active;
    map['CreatedAt'] = createdAt;
    map['UpdatedAt'] = updatedAt;
    map['IsSuccess'] = isSuccess;
    return map;
  }

  Map toJsonWithConvertBool() {
    var map = <String, dynamic>{};
    map['MaDangNhap'] = maDangNhap;
    map['TenNguoiDung'] = tenNguoiDung;
    map['MatKhau'] = matKhau;
    map['MaTinh'] = maTinh;
    map['MaPBCC'] = maPBCC;
    map['DiaChi'] = diaChi;
    map['SDT'] = sdt;
    map['GhiChu'] = ghiChu;
    map['NgayCapNhat'] = ngayCapNhat;
    map['Active'] = active != null
        ? active!
            ? 1
            : 0
        : 0;
    map['CreatedAt'] = createdAt;
    map['UpdatedAt'] = updatedAt;
    map['IsSuccess'] = isSuccess != null
        ? isSuccess!
            ? 1
            : 0
        : 0;
    return map;
  }
}
