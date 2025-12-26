import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_cached_network_image.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: AppColors.colorf3f5f7,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: productEntity.imageUrl,
                  width: double.infinity,
                  height: 99.h,
                  boxFit: BoxFit.cover,
                  borderRadius: 4.r,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.5.w, end: 7.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.name,
                        style: TextStyles.semibold13.copyWith(fontSize: 13.sp),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),

                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${productEntity.price}جنية',
                                    style: TextStyles.bold13.copyWith(
                                      color: AppColors.colorF4A91F,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/',
                                    style: TextStyles.semibold13.copyWith(
                                      color: AppColors.colorF8C76D,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${productEntity.unitAmount} كيلو',
                                    style: TextStyles.semibold13.copyWith(
                                      color: AppColors.colorF8C76D,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.primaryColor,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                context.read<CartCubit>().addProduct(
                                  productEntity,
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
