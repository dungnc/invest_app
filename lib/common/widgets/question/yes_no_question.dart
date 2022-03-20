import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/config/constants/app_colors.dart';
import 'package:statistical_survey/config/constants/app_styles.dart';
import 'package:statistical_survey/resource/resource.dart';

enum SingingCharacter { lafayette, jefferson }

class YesNoQuestion extends StatefulWidget {
  const YesNoQuestion(
      {Key? key,
      required this.onChange,
      required this.question,
      this.child,
      this.value})
      : super(key: key);

  final QuestionCommonModel question;
  final Function(int) onChange;
  final Widget? child;
  final int? value;

  @override
  _YesNoQuestionState createState() => _YesNoQuestionState();
}

class _YesNoQuestionState extends State<YesNoQuestion> {
  int _value = -1;
  @override
  void initState() {
    log('${widget.value}');
    if (widget.value != null) {
      _value = widget.value ?? -1;
      log('$_value');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextQuestion(widget.question.tenCauHoi ?? ''),
        CheckBoxCircle(
            text: 'Có',
            index: 1,
            currentIndex: _value,
            showIndex: false,
            styles: styleMediumBold.copyWith(
                color: blackText, height: 1.0, fontWeight: FontWeight.w600),
            onPressed: (value) {
              widget.onChange(value);
              setState(() {
                _value = value;
              });
            }),
        CheckBoxCircle(
            text: 'Không',
            index: 0,
            currentIndex: _value,
            showIndex: false,
            styles: styleMediumBold.copyWith(
                color: blackText, height: 1.0, fontWeight: FontWeight.w600),
            onPressed: (value) {
              widget.onChange(value);
              setState(() {
                _value = value;
              });
            }),
        if (_value == 1) widget.child ?? Container()
      ],
    );
  }
}
