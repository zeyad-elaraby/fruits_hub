import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/domain/entity/review_entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  // final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expiratioMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  final num sellingCount;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    // required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expiratioMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
