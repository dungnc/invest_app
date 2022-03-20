import 'dart:developer';

import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/modules/modules.dart';

import 'package:statistical_survey/resource/resource.dart';
import 'package:statistical_survey/resource/services/location/location_provider.dart';
import 'package:statistical_survey/routes/routes.dart';

class HomeController extends BaseController {
  HomeController({
    required this.inputDataRepository,
  });
  final InputDataRepository inputDataRepository;

  bool isGrantedPermisstion = false;

  // controler
  MainMenuController mainMenuController = Get.find();

  String? dateTimeSaveDB;

  // Provider
  final backupProvider = BackupProvider();
  final businessPremisesProvider = BusinessPremisesProvider();
  final dataProvider = DataProvider();
  final localityProvider = LocalityProvider();
  final productProvider = ProductProvider();
  final questionCNProductProvider = QuestionCNProductProvider();
  final questionCNProvider = QuestionCNProvider();
  final questionDVLAProductProvider = QuestionDVLAProductProvider();
  final questionDVLAProvider = QuestionDVLAProvider();
  final questionHHProductProvider = QuestionHHProductProvider();
  final questionHHProvider = QuestionHHProvider();
  final questionVTProductProvider = QuestionVTProductProvider();
  final questionVTProvider = QuestionVTProvider();
  final questionDVKProductProvider = QuestionDVKProductProvider();
  final questionDVKProvider = QuestionDVKProvider();
  final questionKHCNProductProvider = QuestionKHCNProductProvider();
  final questionKHCNProvider = QuestionKHCNProvider();
  final statusProvider = StatusProvider();

  // Table
  TableBackup tableBackup = TableBackup();

  @override
  void onInit() async {
    await initProvider();
    await onInitApp();
    // await DatabaseHelper.instance.closeDB();
    super.onInit();
  }

  void toInterViewScreen() async {
    UserModel userModel = mainMenuController.userModel.value;

    //Check data in backup table
    try {
      List _maps = await backupProvider.selectWithDTV(userModel.maDangNhap);

      if (_maps.isNotEmpty) {
        AppPref.dateTimeSaveDB = tableBackup.createdAt;
        Get.toNamed(AppRoutes.locations);
      } else {
        _showSnacbarError();
      }
    } catch (e) {
      _showSnacbarError();
    }
  }

  Future onInitApp() async {
    try {
      UserModel userModel = mainMenuController.userModel.value;
      List _maps = await backupProvider.selectWithDTV(userModel.maDangNhap);
      tableBackup = TableBackup.fromJson(_maps[0]);
      if (_maps.isEmpty) updateData();
    } catch (e) {
      updateData();
      log(e.toString());
    }
  }

  Future updateData() async {
    mainMenuController.setLoading(true);
    if (await AppPermissiton.getStoragePermission()) {
      await createTable(); // createa table
      String? data = await getDataFromServer();
      if (data != null) {
        await saveDataToDB(data);
      }
    }

    mainMenuController.setLoading(false);
  }

  Future syncData() async {
    Get.dialog(DialogWidget(
      onPressedPositive: () {
        Get.back();
        Get.toNamed(AppRoutes.sync);
      },
      onPressedNegative: () {
        Get.back();
      },
      title: "sync".tr,
      content: "sync_confirm".tr,
    ));
  }

  Future showProgress() async {}

  Future createTable() async {
    await backupProvider.createTable();
    await businessPremisesProvider.createTable();
    await dataProvider.createTable();
    await localityProvider.createTable();
    await productProvider.createTable();
    await questionCNProductProvider.createTable();
    await questionCNProvider.createTable();
    await questionDVLAProductProvider.createTable();
    await questionDVLAProvider.createTable();
    await questionHHProductProvider.createTable();
    await questionHHProvider.createTable();
    await questionVTProductProvider.createTable();
    await questionVTProvider.createTable();
    await questionDVKProvider.createTable();
    await questionDVKProductProvider.createTable();
    await questionKHCNProvider.createTable();
    await questionKHCNProductProvider.createTable();
    await statusProvider.createTable();
  }

  Future initProvider() async {
    await backupProvider.init();
    await businessPremisesProvider.init();
    await dataProvider.init();
    await localityProvider.init();
    await productProvider.init();
    await questionCNProductProvider.init();
    await questionCNProvider.init();
    await questionDVLAProductProvider.init();
    await questionDVLAProvider.init();
    await questionHHProductProvider.init();
    await questionHHProvider.init();
    await questionVTProductProvider.init();
    await questionVTProvider.init();
    await questionDVKProvider.init();
    await questionDVKProductProvider.init();
    await questionKHCNProvider.init();
    await questionKHCNProductProvider.init();
    await statusProvider.init();
  }

  Future<String?> getDataFromServer() async {
    var response = await inputDataRepository.getData();
    if (response.isSuccess) {
      dateTimeSaveDB = DateTime.now().toIso8601String();
      tableBackup = await backupData();
      return response.body!;
    } else {
      snackBar('some_error'.tr, 'get_data_error'.tr);
      return null;
    }
  }

  /// Save Data from server into Database
  Future saveDataToDB(String data) async {
    TableData tableData = await _saveData(data);
    await _saveLocality(tableData);
    await _saveBusinessPremises(tableData);
    await _saveProduct(tableData);
  }

  /// Backup Date with userInfo and createdDate and isSuccess
  Future<TableBackup> backupData() async {
    UserModel userModel = mainMenuController.userModel.value;
    TableBackup tableBackup = TableBackup();
    tableBackup
      ..maDangNhap = userModel.maDangNhap
      ..tenNguoiDung = userModel.tenNguoiDung
      ..matKhau = userModel.matKhau
      ..maTinh = userModel.maTinh
      ..maPBCC = userModel.maPBCC
      ..diaChi = userModel.diaChi
      ..sdt = userModel.sDT
      ..ghiChu = userModel.ghiChu
      ..ngayCapNhat = userModel.ngayCapNhat
      ..active = userModel.active
      ..createdAt = dateTimeSaveDB
      ..updatedAt = dateTimeSaveDB
      ..isSuccess = true;
    List<int> ids = await backupProvider
        .insert([tableBackup.toJsonWithConvertBool()], dateTimeSaveDB!);
    return TableBackup.fromJson(await backupProvider.selectOne(ids[0]));
  }

  Future<TableData> _saveData(String data) async {
    TableData tableData = TableData(
      data: data,
      createdAt: tableBackup.createdAt,
      updatedAt: tableBackup.createdAt,
    );
    List<int> ids =
        await dataProvider.insert([tableData.toJson()], tableBackup.createdAt!);

    return TableData.fromJson(await dataProvider.selectOne(ids[0]));
  }

  Future _saveBusinessPremises(TableData data) async {
    List<TableBusinessPremises> localities = data.toBusinesPremises();
    List<Map<String, Object?>> map = [];
    for (var item in localities) {
      item.createdAt = tableBackup.createdAt!;
      item.updatedAt = tableBackup.createdAt!;
      map.add(item.toJsonWithConvertBool());
    }
    await businessPremisesProvider.insert(map, tableBackup.createdAt!);
  }

  Future _saveLocality(TableData data) async {
    List<TableLocality> localities =
        TableLocality.listFromJson(data.toLocalities());
    List<Map<String, Object?>> map = [];
    for (var locality in localities) {
      locality.createdAt = tableBackup.createdAt!;
      locality.updatedAt = tableBackup.createdAt!;
      map.add(locality.toJson());
    }
    await localityProvider.insert(map, tableBackup.createdAt!);
  }

  Future _saveProduct(TableData data) async {
    List<TableProduct> products = data.toProducts();
    List<Map<String, Object?>> map = [];

    // QuestionHH phieu so 1
    List<TableQuestionHH> questionHHs = [];
    List<TableQuestionHHProduct> questionHHProducts = [];

    // QuestionDVLA phieu so 2
    List<TableQuestionDVLA> questionDVLAs = [];
    List<TableQuestionDVLAProduct> questionDVLAProducts = [];

    // QuestionDVLA phieu so 3
    List<TableQuestionDVK> questionDVK = [];
    List<TableQuestionDVKProduct> questionDVKProducts = [];

    // QuestionDVLA phieu so 4
    List<TableQuestionKHCN> questionKHCN = [];
    List<TableQuestionKHCNProduct> questionKHCNProducts = [];

    // QuestionVT phieu so 5
    List<TableQuestionVT> questionVTs = [];
    List<TableQuestionVTProduct> questionVTProducts = [];

    // QuestionCN phieu so 6
    List<TableQuestionCN> questionCNs = [];
    List<TableQuestionCNProduct> questionCNProducts = [];

    for (var product in products) {
      // check product and add product
      product.createdAt = tableBackup.createdAt!;
      product.updatedAt = tableBackup.createdAt!;
      map.add(product.toJson());

      // check questionHH
      if (product.maPhieu != null) {
        if (product.maPhieu == 1 && product.cTPhieuHH != null) {
          questionHHs.add(product.cTPhieuHH!);
          questionHHProducts.addAll(product.cTPhieuHH?.cTPhieuHHSanPham ?? []);
        } else if (product.maPhieu == 2 && product.cTPhieuDVLA != null) {
          questionDVLAs.add(product.cTPhieuDVLA!);
          questionDVLAProducts
              .addAll(product.cTPhieuDVLA?.cTPhieuDVLASanPham ?? []);
        } else if (product.maPhieu == 5 && product.cTPhieuVT != null) {
          questionVTs.add(product.cTPhieuVT!);
          questionVTProducts.addAll(product.cTPhieuVT?.cTPhieuVTASanPham ?? []);
        } else if (product.maPhieu == 6 && product.cTPhieuCN != null) {
          questionCNs.add(product.cTPhieuCN!);
          questionCNProducts.addAll(product.cTPhieuCN?.ctPhieuCnSanPham ?? []);
        } else if (product.maPhieu == 3 && product.cTPhieuDVK != null) {
          questionDVK.add(product.cTPhieuDVK!);
          questionDVKProducts
              .addAll(product.cTPhieuDVK?.cTPhieuDVKSanPham ?? []);
        } else if (product.maPhieu == 4 && product.cTPhieuKHCN != null) {
          questionKHCN.add(product.cTPhieuKHCN!);
          questionKHCNProducts
              .addAll(product.cTPhieuKHCN?.cTPhieuKHCNSanPham ?? []);
        }
      }
    }

    await productProvider.insert(map, tableBackup.createdAt!);

    await Future.wait([
      _saveQuestionHH(questionHHs, questionHHProducts),
      _saveQuestionDVLA(questionDVLAs, questionDVLAProducts),
      _saveQuestionVT(questionVTs, questionVTProducts),
      _saveQuestionCN(questionCNs, questionCNProducts),
      _saveQuestionDVK(questionDVK, questionDVKProducts),
      _saveQuestionKHCN(questionKHCN, questionKHCNProducts),
    ]);
  }

  Future _saveQuestionHH(List<TableQuestionHH> questionHH,
      List<TableQuestionHHProduct> questionHHProduct) async {
    List<Map<String, Object?>> mapHH = [];
    List<Map<String, Object?>> mapHHProduct = [];
    for (var hh in questionHH) {
      hh.createdAt = tableBackup.createdAt!;
      hh.updatedAt = tableBackup.createdAt!;
      mapHH.add(hh.toJson());
    }
    for (var hhProduct in questionHHProduct) {
      hhProduct.createdAt = tableBackup.createdAt!;
      hhProduct.updatedAt = tableBackup.createdAt!;
      mapHHProduct.add(hhProduct.toJson());
    }
    await questionHHProvider.insert(mapHH, tableBackup.createdAt!);
    await questionHHProductProvider.insert(
        mapHHProduct, tableBackup.createdAt!);
  }

  // MaPhieu: 6
  Future _saveQuestionCN(List<TableQuestionCN> questions,
      List<TableQuestionCNProduct> questionsProduct) async {
    List<Map<String, Object?>> mapsQuestions = [];
    List<Map<String, Object?>> mapsProductQuestions = [];

    for (var question in questions) {
      question.createdAt = tableBackup.createdAt!;
      question.updatedAt = tableBackup.createdAt!;
      mapsQuestions.add(question.toJson());
    }

    for (var questionProduct in questionsProduct) {
      questionProduct.createdAt = tableBackup.createdAt!;
      questionProduct.updatedAt = tableBackup.createdAt!;
      mapsProductQuestions.add(questionProduct.toJson());
    }
    if (mapsQuestions.isNotEmpty) {
      await questionCNProvider.insert(mapsQuestions, tableBackup.createdAt!);
    }
    if (mapsProductQuestions.isNotEmpty) {
      await questionCNProductProvider.insert(
          mapsProductQuestions, tableBackup.createdAt!);
    }
  }

  // MaPhieu: 2
  Future _saveQuestionDVLA(List<TableQuestionDVLA> questions,
      List<TableQuestionDVLAProduct> questionsProduct) async {
    List<Map<String, Object?>> mapsQuestions = [];
    List<Map<String, Object?>> mapsProductQuestions = [];

    for (var question in questions) {
      question.createdAt = tableBackup.createdAt!;
      question.updatedAt = tableBackup.createdAt!;
      mapsQuestions.add(question.toJson());
    }
    for (var questionProduct in questionsProduct) {
      questionProduct.createdAt = tableBackup.createdAt!;
      questionProduct.updatedAt = tableBackup.createdAt!;
      mapsProductQuestions.add(questionProduct.toJson());
    }
    if (mapsQuestions.isNotEmpty) {
      await questionDVLAProvider.insert(mapsQuestions, tableBackup.createdAt!);
    }
    if (mapsProductQuestions.isNotEmpty) {
      await questionDVLAProductProvider.insert(
          mapsProductQuestions, tableBackup.createdAt!);
    }
  }

  // MaPhieu: 5
  Future _saveQuestionVT(List<TableQuestionVT> questions,
      List<TableQuestionVTProduct> questionsProduct) async {
    List<Map<String, Object?>> mapsQuestions = [];
    List<Map<String, Object?>> mapsProductQuestions = [];

    for (var question in questions) {
      question.createdAt = tableBackup.createdAt!;
      question.updatedAt = tableBackup.createdAt!;
      mapsQuestions.add(question.toJson());
    }
    for (var questionProduct in questionsProduct) {
      questionProduct.createdAt = tableBackup.createdAt!;
      questionProduct.updatedAt = tableBackup.createdAt!;
      mapsProductQuestions.add(questionProduct.toJson());
    }
    if (mapsQuestions.isNotEmpty) {
      await questionVTProvider.insert(mapsQuestions, tableBackup.createdAt!);
    }
    if (mapsProductQuestions.isNotEmpty) {
      await questionVTProductProvider.insert(
          mapsProductQuestions, tableBackup.createdAt!);
    }
  }

  // MaPhieu: 3
  Future _saveQuestionDVK(List<TableQuestionDVK> questions,
      List<TableQuestionDVKProduct> questionsProduct) async {
    List<Map<String, Object?>> mapsQuestions = [];
    List<Map<String, Object?>> mapsProductQuestions = [];

    for (var question in questions) {
      question.createdAt = tableBackup.createdAt!;
      question.updatedAt = tableBackup.createdAt!;
      mapsQuestions.add(question.toJson());
    }
    for (var questionProduct in questionsProduct) {
      questionProduct.createdAt = tableBackup.createdAt!;
      questionProduct.updatedAt = tableBackup.createdAt!;
      mapsProductQuestions.add(questionProduct.toJson());
    }
    if (mapsQuestions.isNotEmpty) {
      await questionDVKProvider.insert(mapsQuestions, tableBackup.createdAt!);
    }
    if (mapsProductQuestions.isNotEmpty) {
      await questionDVKProductProvider.insert(
          mapsProductQuestions, tableBackup.createdAt!);
    }
  }

  // MaPhieu: 4
  Future _saveQuestionKHCN(List<TableQuestionKHCN> questions,
      List<TableQuestionKHCNProduct> questionsProduct) async {
    List<Map<String, Object?>> mapsQuestions = [];
    List<Map<String, Object?>> mapsProductQuestions = [];

    for (var question in questions) {
      question.createdAt = tableBackup.createdAt!;
      question.updatedAt = tableBackup.createdAt!;
      mapsQuestions.add(question.toJson());
    }
    for (var questionProduct in questionsProduct) {
      questionProduct.createdAt = tableBackup.createdAt!;
      questionProduct.updatedAt = tableBackup.createdAt!;
      mapsProductQuestions.add(questionProduct.toJson());
    }
    if (mapsQuestions.isNotEmpty) {
      await questionKHCNProvider.insert(mapsQuestions, tableBackup.createdAt!);
    }
    if (mapsProductQuestions.isNotEmpty) {
      await questionKHCNProductProvider.insert(
          mapsProductQuestions, tableBackup.createdAt!);
    }
  }

  void _showSnacbarError() {
    snackBar(
      'not_had_db'.tr,
      'need_update_db'.tr,
      style: ToastSnackType.error,
    );
  }
}
