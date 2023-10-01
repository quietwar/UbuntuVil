part of 'product.dart';

Product _$ProductFromJson(Map<String?, dynamic>json) =>
    Product(
        title: '',
        category: '',
        description: '',
        image: '',
        price: '',
        id: ''

    );

Map<String?, dynamic> _$ProductToJson(Product instance) =>
    <String?, dynamic>{
      "title": instance.title,
      "price": instance.price,
      "id": instance.id,
      "description": instance.description,
      "image": instance.image,
      "category": instance.category,
    };