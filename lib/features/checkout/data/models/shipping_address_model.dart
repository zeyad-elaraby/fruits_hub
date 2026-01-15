import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? floor;
  ShippingAddressModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      city: entity.city,
      floor: entity.floor,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "city": city,
      "floor": floor,
    };
  }
}
