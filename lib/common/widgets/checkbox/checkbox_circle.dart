import 'package:flutter/material.dart';
import 'package:statistical_survey/config/config.dart';

class CheckBoxCircle extends StatelessWidget {
  const CheckBoxCircle({
    Key? key,
    required this.text,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
    this.showIndex = true,
    this.styles,
  }) : super(key: key);

  final String text;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;
  final bool showIndex;
  final TextStyle? styles;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppValues.padding / 2),
        child: Row(
          children: [
            _icon(),
            const SizedBox(width: AppValues.padding),
            Expanded(child: _content())
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: currentIndex == index ? primaryColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: currentIndex == index ? primaryColor : greyCheckBox,
        ),
      ),
      child: Image.asset(AppIcons.icTick),
    );
  }

  Widget _content() {
    String _text = showIndex ? '${index + 1}.$text' : text;

    return Text(
      _text,
      style: styles ?? styleMediumBold.copyWith(color: blackText, height: 1.0),
    );
  }
}
