import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
    required this.onItemTap,
    required this.item,
    required this.onClearItem,
  });

  final Function(String) onItemTap;
  final String item;
  final Function(String) onClearItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onItemTap(item),
            child: Row(
              children: [
                SvgPicture.asset(Assets.imagesHistoryIcon),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onClearItem(item),
          child: SvgPicture.asset(Assets.imagesCloseIcon),
        ),
      ],
    );
  }
}
