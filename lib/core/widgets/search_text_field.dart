import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.spaceBetween = 16,
    this.keyBoardType,
    this.controller,
    this.maxLines,
    this.readOnly = false,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.enabled,
    this.onChanged,
    this.onSaved,
  });
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final double? spaceBetween;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final int? maxLines;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool? enabled;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9.r,
            offset: Offset(0, 2.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        validator: widget.validator,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        readOnly: widget.readOnly,
        style: TextStyles.bold13.copyWith(color: AppColors.color949D9E),
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyBoardType ?? TextInputType.text,
        controller: widget.controller,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 25.w,
            vertical: 17.h,
          ),
          hintText: widget.hintText ?? locale.searchAbout,
          prefixIcon:
              widget.prefixIcon ??
              SizedBox(
                width: 20.w,
                child: Center(child: SvgPicture.asset(Assets.imagesSearch)),
              ),
          suffixIcon:
              widget.suffixIcon ??
              SizedBox(
                width: 20.w,
                child: Center(child: SvgPicture.asset(Assets.imagesFilter)),
              ),

          errorStyle: TextStyles.bold13.copyWith(color: AppColors.errorColor),
          hintStyle:
              widget.hintStyle ??
              TextStyles.regular13.copyWith(color: AppColors.color949D9E),
          fillColor: widget.fillColor ?? AppColors.whiteColor,
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.whiteColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.whiteColor,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.whiteColor,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.whiteColor,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.w),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 2.w),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
          ),
        ),
      ),
    );
  }
}
