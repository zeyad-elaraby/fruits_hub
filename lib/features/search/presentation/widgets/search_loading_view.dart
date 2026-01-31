import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_dummy_products.dart';
import 'package:fruits_hub/features/home/presentation/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          ),
        ],
      ),
    );
  }
}
