import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          // (pageController.hasClients ? pageController.page!.round() : 0) ==
          // 0,
          image: Assets.imagesPageViewItem1Image,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مرحبًا بك في", style: TextStyles.bold23),
              SizedBox(width: 5.w),

              Text(
                "HUB",
                style: TextStyles.bold23.copyWith(color: AppColors.colorF4A91F),
              ),
              Text(
                "Fruit",
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          background: Assets.imagesPageViewItem1Background,
        ),
        PageViewItem(
          isVisible: false,
          // (pageController.hasClients ? pageController.page!.round() : 0) ==
          // 0,
          image: Assets.imagesPageViewItem2Image,
          title: Text("ابحث وتسوق", style: TextStyles.bold23),
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          background: Assets.imagesPageViewItem2Background,
        ),
      ],
    );
  }
}
