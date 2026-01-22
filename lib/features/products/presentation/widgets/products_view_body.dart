import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/products/presentation/widgets/products_view_header.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(title: locale.products, isBackButton: false),
                SizedBox(height: 16.h),
                SearchTextField(),
                SizedBox(height: 12.h),
                ProductsViewHeader(
                  numOfResults: context.read<ProductsCubit>().productsLength,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
