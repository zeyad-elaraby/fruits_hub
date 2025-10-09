import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: TextStyles.bold19),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
