import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:fruits_hub/features/layout/presentation/widgets/main_view_body.dart';

class MainViewBodyBlocListiner extends StatelessWidget {
  const MainViewBodyBlocListiner({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          customSnackBar(
            context: context,
            title: 'تم اضافة المنتج',
            message: 'تم اضافة المنتج بنجاح',
            contentType: ContentType.success,
          );
        }
        if (state is CartItemRemoved) {
          customSnackBar(
            context: context,
            title: 'تم حذف المنتج',
            message: 'تم حذف المنتج بنجاح',
            contentType: ContentType.success,
          );
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
