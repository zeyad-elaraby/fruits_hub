import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'item_entity.dart';

class ItemListEntity {
  List<ItemEntity>? items;

  ItemListEntity({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
  factory ItemListEntity.fromEntities(List<CartItemEntity> entities) {
    return ItemListEntity(
      items: entities.map((e) => ItemEntity.fromEntity(e)).toList(),
    );
  }
}
