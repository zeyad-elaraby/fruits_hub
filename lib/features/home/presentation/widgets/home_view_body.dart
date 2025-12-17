import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
                SearchTextField(),
                SizedBox(height: 12.h),
                FeaturedList(),
                SizedBox(height: 12.h),
                BestSellingHeader(),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          HomeBestSellingGridView(),
        ],
      ),
    );
  }
}
