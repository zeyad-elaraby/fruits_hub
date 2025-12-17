import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/custom_auth_app_bar.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/widgets/best_selling_view_body.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S();
    return Scaffold(
      appBar: CustomAppBar(title: locale.bestSelling),
      body: BestSellingViewBody(),
    );
  }
}
