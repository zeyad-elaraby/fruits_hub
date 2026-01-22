import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_decorations.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem({
    super.key,
    this.headerTitle,
    required this.child,
    this.padding = const EdgeInsetsGeometry.symmetric(
      horizontal: 9,
      vertical: 5,
    ),
  });
  final String? headerTitle;
  final Widget child;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerTitle != null) ...[
          Text(headerTitle!, style: TextStyles.bold13),
          SizedBox(height: 8.h),
        ],
        Container(
          padding: padding,
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
