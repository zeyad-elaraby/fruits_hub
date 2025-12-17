import 'package:fruits_hub/core/utils/app_images.dart';

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

List<BottomNavigationEntity> bottomNavigationBarItems = [
  BottomNavigationEntity(
    activeIcon: Assets.imagesIconsBoldHome,
    inactiveIcon: Assets.imagesIconsOutlinedHome,
    label: 'الرئيسية',
  ),
  BottomNavigationEntity(
    activeIcon: Assets.imagesIconsBoldProducts,
    inactiveIcon: Assets.imagesIconsOutlinedProducts,
    label: 'المنتجات',
  ),
  BottomNavigationEntity(
    activeIcon: Assets.imagesIconsBoldShoppingCart,
    inactiveIcon: Assets.imagesIconsOutlinedShoppingCart,
    label: 'سلة التسوق',
  ),
  BottomNavigationEntity(
    activeIcon: Assets.imagesIconsBoldUser,
    inactiveIcon: Assets.imagesIconsOutlinedUser,
    label: 'حسابي',
  ),
];
