import 'package:flutter/material.dart';
import 'package:statistical_survey/common/common.dart';
import 'package:statistical_survey/resource/database/database.dart';
import 'package:statistical_survey/resource/model/model.dart';

class InputInt extends StatelessWidget {
  const InputInt(
      {required this.question,
      required this.onChange,
      this.validator,
      this.type = 'int',
      this.value,
      this.enable = true,
      this.subName,
      this.product,
      Key? key})
      : super(key: key);

  final QuestionCommonModel question;
  final Function(num) onChange;
  final String? Function(String?)? validator;
  final String type;
  final num? value;
  final bool enable;
  final String? subName;
  final TableProduct? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextQuestion(
          _handleText(),
          level: question.cap ?? 2,
          product: product,
        ),
        const SizedBox(height: 4),
        WidgetFieldInput(
          controller: TextEditingController(
              text: value != null ? value.toString() : ''),
          enable: enable,
          hint: 'Nhập vào đây',
          keyboardType: TextInputType.number,
          validator: validator,
          onChanged: (value) {
            // cover string to double
            if (value == '') {
              onChange(0);
            } else {
              if (type == 'int') {
                var myDouble = int.parse(value);

                assert(myDouble is int);
                onChange(myDouble);
              } else {
                var v = double.parse(value);

                assert(v is double);
                onChange(v);
              }
            }
          },
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
// class InputInt extends StatefulWidget {
//   // InputInt({Key? key}) : super(key: key);
//   const InputInt(
//       {required this.question,
//       required this.onChange,
//       this.validator,
//       this.type = 'int',
//       this.value,
//       this.enable = true,
//       this.subName,
//       this.product,
//       Key? key})
//       : super(key: key);

//   final QuestionCommonModel question;
//   final Function(num) onChange;
//   final String? Function(String?)? validator;
//   final String type;
//   final num? value;
//   final bool enable;
//   final String? subName;
//   final TableProduct? product;

//   @override
//   _InputIntState createState() => _InputIntState();
// }

// class _InputIntState extends State<InputInt> {
//   // ignore: prefer_final_fields
//   TextEditingController _controller = TextEditingController();
//   @override
//   void initState() {
//     if (widget.value != null) {
//       _controller.text = widget.value.toString();
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextQuestion(
//           _handleText(),
//           level: widget.question.cap ?? 2,
//           product: widget.product,
//         ),
//         const SizedBox(height: 4),
//         WidgetFieldInput(
//           controller: _controller,
//           enable: widget.enable,
//           hint: 'Nhập vào đây',
//           keyboardType: TextInputType.number,
//           validator: widget.validator,
//           onChanged: (value) {
//             // cover string to double
//             if (value == '') {
//               widget.onChange(0);
//             } else {
//               if (widget.type == 'int') {
//                 var myDouble = int.parse(value);

//                 assert(myDouble is int);
//                 widget.onChange(myDouble);
//               } else {
//                 var v = double.parse(value);

//                 assert(v is double);
//                 widget.onChange(v);
//               }
//             }
//           },
//           suffix: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.question.dVT ?? '',
//                   style: TextStyle(color: Theme.of(context).hintColor),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }

//   String _handleText() {
//     var _mainName = widget.question.tenCauHoi ?? '';

//     if (widget.subName != null) {
//       if (_mainName.contains('[')) {
//         String _string1 = _mainName.substring(0, _mainName.indexOf('['));
//         String _string2 = widget.subName ?? '';
//         String _string3 = _mainName.substring(_mainName.indexOf(']') + 1);
//         return _string1 + _string2 + _string3;
//       }
//     }

//     return _mainName;
//   }
// }
