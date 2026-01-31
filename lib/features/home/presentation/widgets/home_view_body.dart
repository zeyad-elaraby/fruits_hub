import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppbar(),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.searchView);
                  },
                  child: SearchTextField(enabled: false),
                ),
                SizedBox(height: 12.h),
                FeaturedList(),
                SizedBox(height: 12.h),
                BestSellingHeader(),
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
