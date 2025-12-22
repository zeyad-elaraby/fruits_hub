import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_selling_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S();
    return Scaffold(
      appBar: CustomAppBar(title: locale.bestSelling, isBackButton: true),
      body: BlocProvider(
        create: (context) => sl<ProductsCubit>(),
        child: BestSellingViewBody(),
      ),
    );
  }
}
