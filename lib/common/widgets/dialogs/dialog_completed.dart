import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';

class DialogCompletedQuestion extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final Function(String?)? onChangeName;
  final Function(String?)? onChangePhone;
  final Function() onOk;
  final String title;

  DialogCompletedQuestion({
    Key? key,
    this.onChangeName,
    this.onChangePhone,
    required this.onOk,
    this.title = "Hoàn thành phiếu",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      onPressedPositive: onOk,
      onPressedNegative: Get.back,
      title: title,
      content: '',
      body: Column(
        children: [
          WidgetFieldInput(
            controller: nameController,
            hint: 'Nhập tên người trả lời',
            onChanged: onChangeName,
          ),
          const SizedBox(height: 12),
          WidgetFieldInput(
            controller: phoneController,
            hint: 'Nhập số điện thoại người trả lời',
            onChanged: onChangePhone,
          ),
        ],
      ),
    );
  }
}
