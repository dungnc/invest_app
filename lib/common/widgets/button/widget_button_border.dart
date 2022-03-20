import 'package:flutter/material.dart';
import 'package:statistical_survey/config/config.dart';

class WidgetButtonBorder extends StatelessWidget {
  const WidgetButtonBorder({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.borderLv1),
          ),
          side: const BorderSide(width: 1, color: primaryColor),
        ),
        child: Text(title, style: styleSmallBold.copyWith(color: primaryColor)),
      ),
    );
  }
}
