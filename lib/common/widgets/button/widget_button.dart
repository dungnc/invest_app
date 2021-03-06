import 'package:flutter/material.dart';
import 'package:statistical_survey/config/config.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    this.iconCenter,
    required this.title,
    required this.onPressed,
    this.background,
  }) : super(key: key);

  final Widget? iconCenter;
  final String title;
  final Function() onPressed;
  final Color? background;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.buttonHeight,
      decoration: BoxDecoration(
        color: background ?? primaryColor,
        borderRadius: BorderRadius.circular(AppValues.borderLv1),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(primaryDarkColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconCenter ?? const SizedBox(),
            iconCenter != null ? const SizedBox(width: 8) : const SizedBox(),
            Text(title, style: styleSmallBold.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
