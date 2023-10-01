part of 'cart.dart';

Map<String?, dynamic> _$CartFromJson(Product instance) =>
    <String?, dynamic>{
      "title": instance.title,
      "price": instance.price,
      "id": instance.id,
      "description": instance.description,
      "image": instance.image,
      "category": instance.category,
    };