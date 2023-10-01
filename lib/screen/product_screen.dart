

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_villages/model/product.dart';
import 'package:ubuntu_villages/widget/custom_button.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  Future<void> onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });

   // await FireStoreUtil.addToCart(
       // Provider.of<ApplicationState>(context, listen: false).user,widget.product.id);

    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        const Text(
                          "MRP: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "\$" + widget.product.price.toString?(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomButton(
                        text: "Add to cart",
                        onPressed: onAddToCart,
                        loading: addButtonLoad),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 15),
                    child: Text(
                      "About the Item",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    child: Text(
                      widget.product.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Center(
                      child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 35,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                child: IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

