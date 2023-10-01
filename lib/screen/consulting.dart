// import 'package:flutter/material.dart';
//
//
// import '../widget/single_product.dart';
// import 'product_screen.dart';
//
//
// class ConsultingScreen extends StatefulWidget {
//   const ConsultingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ConsultingScreen> createState() => _ConsultingScreenState();
// }
//
// class _ConsultingScreenState extends State<ConsultingScreen> {
//
//   // Widget _buildRecentProduct() {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Row(
//   //         children: const [
//   //           Text("Recent item you will  like",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
//   //         ],
//   //       ),
//   //       const SizedBox(height: 5,),
//   //       SingleChildScrollView(
//   //         scrollDirection: Axis.horizontal,
//   //         child: Row(
//   //           children: const [
//   //             SingleProduct(productImage: "https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
//   //                 productName: "Polo",
//   //                 //onTap: (){}
//   //             ),
//   //
//   //           ],
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
//   // Widget _buildShoeProduct(BuildContext context) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.all(8),
//   //         child: Row(
//   //           children: const [
//   //             Text(
//   //               "Shoes",
//   //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//   //             ),
//   //             Spacer(),
//   //             Text(
//   //               "View all",
//   //               style: TextStyle(
//   //                   fontWeight: FontWeight.bold,
//   //                   fontSize: 15,
//   //                   color: Colors.orange),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       SingleChildScrollView(
//   //         scrollDirection: Axis.horizontal,
//   //         child: Row(
//   //           children: [
//   //             GestureDetector(
//   //               onTap: () {
//   //                 Navigator.of(context).push(
//   //                   MaterialPageRoute(
//   //                     builder: (context) => ItemDetailScreen(
//   //                       productName:"Air Max",
//   //                       productImage:     "https://images.unsplash.com/photo-1608231387042-66d1773070a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
//   //                     )
//   //                   ),
//   //                 );
//   //               },
//   //               child: const SingleProduct(
//   //                // onTap: () {},
//   //                 productImage:
//   //                 "https://images.unsplash.com/photo-1608231387042-66d1773070a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
//   //                 productName: "Air Max",
//   //               ),
//   //             ),
//   //
//   //           ],
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
//   // Widget _buildClothesProduct(BuildContext context) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.all(8),
//   //         child: Row(
//   //           children: const [
//   //             Text(
//   //               "Clothes",
//   //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//   //             ),
//   //             Spacer(),
//   //             Text(
//   //               "View all",
//   //               style: TextStyle(
//   //                   fontWeight: FontWeight.bold,
//   //                   fontSize: 15,
//   //                   color: Colors.orange),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       SingleChildScrollView(
//   //         scrollDirection: Axis.horizontal,
//   //         child: Row(
//   //           children: const [
//   //             SingleProduct(
//   //                 productImage: "https://images.unsplash.com/photo-1581655353564-df123a1eb820?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
//   //                 productName: "Polo",
//   //                // onTap: () {}
//   //             ),
//   //
//   //           ],
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey[200],
//         title: const Text("Shop"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: const [
//               // _buildRecentProduct(),
//               // _buildShoeProduct(context),
//               // _buildClothesProduct(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
