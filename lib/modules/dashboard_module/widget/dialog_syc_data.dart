import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/config/constants/app_colors.dart';
import 'package:statistical_survey/config/constants/app_images.dart';
import 'package:statistical_survey/config/constants/app_styles.dart';
import 'package:statistical_survey/config/constants/app_values.dart';

// class DialogSyn extends s {
//   const DialogSyn({Key? key}) : super(key: key);

// }

class DialogSyn extends StatefulWidget {
  final double? progress;

  const DialogSyn({Key? key, this.progress}) : super(key: key);

  @override
  _DialogSynState createState() => _DialogSynState();
}

class _DialogSynState extends State<DialogSyn> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.padding),
      ),
      // insetPadding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "syncing_data".tr,
              style: styleLargeBold.copyWith(color: warningColor),
            ),
            const Image(
              image: AssetImage(
                AppImages.uploadAnimation,
              ),
              width: 200,
              height: 200,
            ),
            Text(
              'warning_sync'.tr,
              style: styleSmallBold.copyWith(color: greyColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: widget.progress ?? 0.5,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${(widget.progress ?? 0) * 100}%',
                    style: styleSmallBold.copyWith(color: greyColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
