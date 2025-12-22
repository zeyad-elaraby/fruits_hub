import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/widgets/best_selling_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 16.w,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          BestSellingItem(productEntity: products[index]),
    );
  }
}
