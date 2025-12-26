
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/products/presentation/views/products_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentIndex,
      children: [HomeView(), ProductsView(), CartView()],
    );
  }
}
