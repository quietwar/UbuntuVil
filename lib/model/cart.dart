import 'package:json_annotation/json_annotation.dart';
import 'package:ubuntu_villages/model/product.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product{
  int count = 0;
  Cart(
      String? title,double price,String id,String description,
      String? image,String category,this.count
      ):super(title: title,price:'',id: id,description: description,image: image,category: category);

   //factory Cart.fromJson(Map<String,dynamic>json) => _$CartfromJson(json);
}





