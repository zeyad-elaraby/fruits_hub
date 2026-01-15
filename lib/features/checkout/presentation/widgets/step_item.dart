import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.stepNumber,
    this.onTap,
  });
  final bool isActive;
  final String text, stepNumber;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedCrossFade(
        firstChild: InActiveStepItem(text: text, stepNumber: stepNumber),
        secondChild: ActiveStepItem(text: text),
        crossFadeState: isActive
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
