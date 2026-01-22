import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/generated/l10n.dart';

class BottomNavigationEntity {
  BottomNavigationEntity({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
  final String activeIcon;
  final String inactiveIcon;
  final String label;
}

List<BottomNavigationEntity> getBottomNavigationBarItems(BuildContext context) {
  return [
    BottomNavigationEntity(
      activeIcon: Assets.imagesIconsBoldHome,
      inactiveIcon: Assets.imagesIconsOutlinedHome,
      label: S.of(context).home,
    ),
    BottomNavigationEntity(
      activeIcon: Assets.imagesIconsBoldProducts,
      inactiveIcon: Assets.imagesIconsOutlinedProducts,
      label: S.of(context).products,
    ),
    BottomNavigationEntity(
      activeIcon: Assets.imagesIconsBoldShoppingCart,
      inactiveIcon: Assets.imagesIconsOutlinedShoppingCart,
      label: S.of(context).shoppingCart,
    ),
    BottomNavigationEntity(
      activeIcon: Assets.imagesIconsBoldUser,
      inactiveIcon: Assets.imagesIconsOutlinedUser,
      label: S.of(context).myAccount,
    ),
  ];
}
