import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_villages/model/cart.dart';
import 'package:ubuntu_villages/widget/custom_button.dart';
import 'package:ubuntu_villages/widget/list_card.dart';
import 'package:ubuntu_villages/widget/loader.dart';
import 'package:ubuntu_villages/widget/services/common.dart';
import 'package:ubuntu_villages/widget/services/firestore.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);


  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  //final carts = ["1", "2"];
  Future<List<Cart>>? carts;
  bool _checkOutButtonLoading = false;

  @override
  void initState() {
    super.initState();
    carts = FireStoreUtil.getCart(Provider.of(context, listen: false).user);
  }


  void checkOut() async {
    setState(() {
      _checkOutButtonLoading = true;
    });
    String? error = await CommonUtil.checkoutFlow(
        Provider.of(context, listen: false).user!);
    if (error.isEmpty) {
      CommonUtil.showAlert(context,"Success", "your order is placed");
    } else {
     CommonUtil.showAlert(context, "Alert", error);
    }
    CommonUtil.showAlert(context, "Error processing your order", "");
    setState(() {
      _checkOutButtonLoading = false;
      carts = FireStoreUtil.getCart(Provider.of(context).user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
        future: carts,
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListCard(cart: snapshot.data![index]);
                      }),
                  priceFooter(snapshot.data!),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: CustomButton(
                      text: "CHECKOUT",
                      onPressed: checkOut,
                      loading: false,
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.data != null && snapshot.data!.isEmpty) {
            return const Center(
              child: Icon(
                Icons.add_shopping_cart_sharp,
                color: Colors.yellow,
                size: 150,
              ),
            );
          }
          return const Center(
            child: Loader(scale: 1),
          );
        });
  }

  priceFooter(List<Cart> carts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Divider(
            height: 2,
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Text(
                  "Total: ,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$ ${FireStoreUtil.getCartTotal(carts)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
