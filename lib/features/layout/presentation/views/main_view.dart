import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/products/presentation/views/products_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getCurrentView(_currentIndex)),

      bottomNavigationBar: CustomBottomNavigationBar(
        onItmTapped: (tappedIndex) {
          _currentIndex = tappedIndex;
          setState(() {});
        },
      ),
    );
  }

  Widget getCurrentView(int index) {
    return IndexedStack(index: index, children: [HomeView(), ProductsView()]);
  }
}
