import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var lcale = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lcale.bestSelling, style: TextStyles.bold16),
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.bestSellingView),
          child: Text(
            lcale.more,
            style: TextStyles.regular13.copyWith(color: AppColors.color949D9E),
          ),
        ),
      ],
    );
  }
}
