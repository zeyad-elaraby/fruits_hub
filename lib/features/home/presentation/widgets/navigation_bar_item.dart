import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_entity.dart';
import 'package:fruits_hub/features/home/presentation/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationEntity,
  });
  final bool isActive;
  final BottomNavigationEntity bottomNavigationEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            image: bottomNavigationEntity.activeIcon,
            label: bottomNavigationEntity.label,
          )
        : InActiveItem(image: bottomNavigationEntity.inactiveIcon);
  }
}
