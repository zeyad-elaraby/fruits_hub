import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

abstract class AppDecorations {
  static final greyBoxDecoration = ShapeDecoration(
    color: AppColors.colorF9F9F9,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
