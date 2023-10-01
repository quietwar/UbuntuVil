import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String;?? title;
  String? price;
  String? id;
  String? description;
  String? image;

  @JsonKey(defaultValue: "")
  String? category;

  Product(
      {required this.title, required this.image, required this.id,
        required this.price, required this.category, required this.description});

factory Product.fromJson(Map<String?,dynamic>json)=> _$ProductFromJson(json);

Map<String?,dynamic> toJson() => _$ProductToJson(this);
}