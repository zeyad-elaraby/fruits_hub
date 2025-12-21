import 'package:fruits_hub/core/domain/entity/product_entity.dart';

getDummyProduct() {
  return ProductEntity(
    name: 'Product 1',
    price: "20",
    description: 'Description 1',
    code: 'Code 1',
    expiratioMonths: 1,
    numberOfCalories: 1,
    unitAmount: 1,
    reviews: [],
    isFeatured: true,
    avgRating: 3,
    isOrganic: true,
    ratingCount: 3,
    imageUrl:
        "https://unsplash.com/photos/sliced-orange-fruit-and-green-round-fruits-M_xIaxQE3Ms",
    sellingCount: 1,
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
