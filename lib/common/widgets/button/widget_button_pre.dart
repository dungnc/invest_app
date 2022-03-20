import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/config/config.dart';

class WidgetButtonPrevious extends StatelessWidget {
  const WidgetButtonPrevious({
    Key? key,
    required this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);
  final Function() onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppValues.buttonHeight,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.borderLv1),
          border: Border.all(color: primaryColor)),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(greyBorder),
          ),
          child: Row(
            children: [
              Image.asset(AppIcons.icArrowPre),
              Expanded(
                child: Text(
                  'pre'.tr,
                  textAlign: TextAlign.center,
                  style:
                      styleSmallBold.copyWith(color: primaryColor, height: 1),
                ),
              ),
            ],
          )),
    );
  }
}
