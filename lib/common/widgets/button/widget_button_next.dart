import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/config/config.dart';

class WidgetButtonNext extends StatelessWidget {
  const WidgetButtonNext({
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
        color: primaryColor,
        borderRadius: BorderRadius.circular(AppValues.borderLv1),
      ),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(primaryLightColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'next'.tr,
                  textAlign: TextAlign.center,
                  style:
                      styleSmallBold.copyWith(color: Colors.white, height: 1),
                ),
              ),
              Image.asset(AppIcons.icArrowNext)
            ],
          )),
    );
  }
}
