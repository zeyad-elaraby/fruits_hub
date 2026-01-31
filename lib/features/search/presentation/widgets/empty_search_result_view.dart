import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

class EmptySearchResultView extends StatelessWidget {
  const EmptySearchResultView({super.key, required this.query});
final String query;
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
                context.read<SearchCubit>().saveRecent(query);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesEmptySearchResult,
              height: 230.h,
              width: 230.w,
            ),
            SizedBox(height: 43.h),
            Text(
              local.search,
              style: TextStyles.bold16.copyWith(color: AppColors.color616A6B),
            ),
            SizedBox(height: 10.h),
            Text(
              local.infoNotAvailable,
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(color: AppColors.color949D9E),
            ),
          ],
        ),
      ),
    );
  }
}
