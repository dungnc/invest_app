import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/common/utils/utils.dart';
import 'package:statistical_survey/config/constants/app_styles.dart';
import 'package:statistical_survey/modules/question_module/question_module.dart';
import 'package:statistical_survey/resource/resource.dart';

class TextQuestion extends StatelessWidget {
  TextQuestion(this.text, {this.level = 2, this.product});

  final String text;
  final int level; // the level question, is have range = [1,2,3,4,5,6,7,8]
  final TableProduct? product;
  final GeneralInformationController generalInformationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _getMargin(), bottom: _getMargin() - 4),
      child: Text(_handleText(), style: _getStyle()),
    );
  }

  TextStyle _getStyle() {
    switch (level) {
      case 2:
        return styleLargeBold;
      case 1:
        return styleLargeBold;

      default:
        return styleMedium;
    }
  }

  String _handleText() {
    var _today = DateTime.now();
    var _lastMonth = DateTime(_today.year, _today.month - 1);
    var month = DateTimeUtil.toMonthYearDate;

    int _quy = generalInformationController.tableBKHo.value.quy ?? 0;

    String _text = text;

    if (text.contains('Chia ra:')) {
      return text.replaceFirst('Chia ra:', '').trim();
    }

    if (text.contains('thời điểm')) {
      String _today = DateTimeUtil.toDayMonthYearDate(DateTime.now());
      String _title = text.replaceAll('[…]', _today);

      return _title;
    }

    _text = _text.replaceAll('[tháng trước]', month(_lastMonth));
    if (_text.toLowerCase().contains('tháng [trước]')) {
      _text = _text.replaceAll('[trước]', month(_lastMonth));
    }

    _text = _text.replaceAll('[tháng báo cáo]', "tháng ${month(_today)}");
    _text = _text.replaceAll('[báo cáo]', month(_today));
    _text = _text.replaceAll('[SẢN PHẨM]', product?.tenSanPham ?? "");

    _text = _text.replaceAll('[quý báo cáo]', "quý $_quy");
    _text = _text.replaceAll('[quý trước]', "qúy ${_quy - 1}");

    if (_text.toLowerCase().contains('quý [trước]')) {
      _text = _text.replaceAll('[trước]', "${_quy - 1}");
    }

    return _text;
  }

  double _getMargin() {
    switch (level) {
      case 2:
        return 12;
      case 1:
        return 16;

      default:
        return 8;
    }
  }
}
