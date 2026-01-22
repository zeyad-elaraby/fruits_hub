import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'package:fruits_hub/features/checkout/presentation/widgets/step_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.onTap,
  });
  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps(context).length, (index) {
        return Expanded(
          child: StepItem(
            onTap: () => onTap(index),
            isActive: index <= currentPageIndex,
            text: getSteps(context)[index],
            stepNumber: (index + 1).toString(),
          ),
        );
      }),
    );
  }
}

getSteps(BuildContext context) {
  return [S.of(context).shipping, S.of(context).address, S.of(context).payment];
}
