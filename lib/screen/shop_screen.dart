import 'package:flutter/material.dart';
import 'package:ubuntu_villages/model/product.dart';
import 'package:ubuntu_villages/screen/product_screen.dart';
import 'package:ubuntu_villages/widget/grid_card.dart';
import 'package:ubuntu_villages/widget/loader.dart';
import 'package:ubuntu_villages/widget/services/firestore.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final data = ["1", "2"];
  Future<List<Product>>? products;
  late final Product product;


  @override
  void initState() {
    super.initState();
    products = FireStoreUtil.getProduct([]);
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  ProductScreen(product: product,)));
    }

    return FutureBuilder<List<Product>>(
        future: products,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridCard(
               product:   snapshot.data![index],
                    index: index,
                    onPressed: () {
                      onCardPress(snapshot.data![index]);
                    });
              },
            );
          } else {
            return const Center(
              child: Loader(
                scale: 1,
              ),
            );
          }
        });
  }
}
