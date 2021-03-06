import 'package:flutter/material.dart';
import 'package:statistical_survey/config/config.dart';
import 'package:statistical_survey/config/constants/app_colors.dart';
import 'package:statistical_survey/config/constants/app_styles.dart';
import 'package:statistical_survey/config/constants/app_values.dart';

class WidgetFieldInput extends StatelessWidget {
  const WidgetFieldInput(
      {Key? key,
      required this.controller,
      required this.hint,
      this.validator,
      this.label,
      this.prefix,
      this.suffix,
      this.bgColor,
      this.isHideContent,
      this.enable,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final Color? bgColor;
  final bool? isHideContent;
  final bool? enable;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label!, style: styleSmall) : const SizedBox(),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.borderLv1),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: TextFormField(
              controller: controller,
              style: styleSmall,
              obscureText: isHideContent ?? false,
              enabled: enable ?? true,
              validator: validator,
              decoration: InputDecoration(
                prefixIcon: prefix,
                suffixIcon: suffix,
                hintText: hint,
                fillColor: bgColor ?? backgroundColor,
                contentPadding:
                    const EdgeInsets.only(top: 4, left: 16, right: 16),
                hintStyle: styleSmall.copyWith(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.borderLv1),
                  borderSide: const BorderSide(
                    color: greyBorder,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.borderLv1),
                  borderSide: const BorderSide(
                    color: greyBorder,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.borderLv1),
                  borderSide: const BorderSide(
                    color: errorColor,
                    width: 1.0,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.borderLv1),
                  borderSide: const BorderSide(
                    color: errorColor,
                    width: 1.0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.borderLv1),
                  borderSide: const BorderSide(
                    color: greyBorder,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: keyboardType,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
