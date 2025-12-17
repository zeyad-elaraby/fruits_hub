import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/widgets/best_selling_item.dart';

class HomeBestSellingGridView extends StatelessWidget {
  const HomeBestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 16.w,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => BestSellingItem(),
    );
  }
}
