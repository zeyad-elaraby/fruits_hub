import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_items.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(4, (index) => FeaturedItem())),
    );
  }
}
