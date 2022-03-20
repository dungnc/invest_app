import 'package:flutter/material.dart';
import 'package:statistical_survey/config/constants/app_styles.dart';

class AppBarHeader extends StatelessWidget with PreferredSizeWidget {
  const AppBarHeader({Key? key,
    required this.title,
    required this.onPressedLeading,
    required this.iconLeading,
    this.actions,
  }) : super(key: key);

  final String title;
  final Function() onPressedLeading;
  final Widget iconLeading;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressedLeading,
        icon: iconLeading,
      ),
      centerTitle: true,
      actions: [actions?? const SizedBox()],
      title: Text(title, style: styleMediumBold ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
