import 'dart:io';

import 'package:fruits_hub/core/data/models/review_model.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final String price;
  final bool isFeatured;
  String? imageUrl;
  final int expiratioMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final num sellingCount;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expiratioMonths,
    required this.numberOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json['name'],
    code: json['code'],
    description: json['description'],
    price: json['price'],
    isFeatured: json['isFeatured'],
    imageUrl: json['imageUrl'],
    isOrganic: json['isOrganic'],
    expiratioMonths: json['expiratioMonths'],
    numberOfCalories: json['numberOfCalories'],
    avgRating: json['avgRating'],
    ratingCount: json['ratingCount'],
    unitAmount: json['unitAmount'],
    reviews: json['reviews'] != null
        ? List<ReviewModel>.from(
            json['reviews'].map((x) => ReviewModel.fromJson(x)),
          )
        : [],
    sellingCount: json['sellingCount'],
  );

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      imageUrl: imageUrl,
      isOrganic: isOrganic,
      avgRating: avgRating,
      ratingCount: ratingCount,
      isFeatured: isFeatured,
      expiratioMonths: expiratioMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      sellingCount: sellingCount,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'isOrganic': isOrganic,
    'expiratioMonths': expiratioMonths,
    'numberOfCalories': numberOfCalories,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
    'unitAmount': unitAmount,
    "reviews": reviews.map((e) => e.toJson()).toList(),
    'sellingCount': sellingCount,
  };
}
