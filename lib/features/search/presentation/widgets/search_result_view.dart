import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_cubit.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({
    super.key,
    required this.products,
    required this.query,
  });
  final List<ProductEntity> products;
  final String query;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<SearchCubit>().saveRecent(query);
        },
        child: GridView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 163 / 214,
              child: FruitItem(productEntity: products[index]),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
