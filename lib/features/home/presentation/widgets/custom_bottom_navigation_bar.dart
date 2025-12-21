import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/layout/domain/entities/bottom_navigation_entity.dart';
import 'package:fruits_hub/features/layout/presentation/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItmTapped});
  final ValueChanged<int> onItmTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 25.r,
            offset: Offset(0, -2.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var entity = e.value;
          int index = e.key;
          return Expanded(
            flex: selectedIndex == index ? 3 : 2,

            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItmTapped(index);
                });
              },
              child: NavigationBarItem(
                bottomNavigationEntity: entity,
                isActive: index == selectedIndex,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
