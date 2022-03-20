import 'package:flutter/material.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/resource/model/model.dart';

class InputString extends StatelessWidget {
  const InputString(
      {required this.question,
      required this.onChange,
      this.validator,
      this.type = 'int',
      this.value,
      this.enable = true,
      this.subName,
      Key? key})
      : super(key: key);

  final QuestionCommonModel question;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final String type;
  final String? value;
  final bool enable;
  final String? subName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextQuestion(
          _handleText(),
          level: question.cap ?? 2,
        ),
        const SizedBox(height: 4),
        WidgetFieldInput(
          controller: TextEditingController(text: value),
          enable: enable,
          hint: 'Nhập vào đây',
          // keyboardType: TextInputType.number,
          validator: validator,
          onChanged: onChange,
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  question.dVT ?? '',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String _handleText() {
    var _mainName = question.tenCauHoi ?? '';

    if (subName != null) {
      if (_mainName.contains('[')) {
        String _string1 = _mainName.substring(0, _mainName.indexOf('['));
        String _string2 = subName ?? '';
        String _string3 = _mainName.substring(_mainName.indexOf(']') + 1);
        return _string1 + _string2 + _string3;
      }
    }

    return _mainName;
  }
}


// class InputString extends StatefulWidget {
//   // InputInt({Key? key}) : super(key: key);
//   const InputString(
//       {required this.question,
//       required this.onChange,
//       this.validator,
//       this.type = 'int',
//       this.value,
//       this.enable = true,
//       this.subName,
//       Key? key})
//       : super(key: key);

//   final QuestionCommonModel question;
//   final Function(String) onChange;
//   final String? Function(String?)? validator;
//   final String type;
//   final num? value;
//   final bool enable;
//   final String? subName;

//   @override
//   _InputIntState createState() => _InputIntState();
// }

// class _InputIntState extends State<InputInt> {
//   // ignore: prefer_final_fields
//   TextEditingController _controller = TextEditingController();
//   @override
//   void initState() {
//     if (value != null) {
//       _controller.text = value.toString();
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

// }
