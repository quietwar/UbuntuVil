import 'package:flutter/material.dart';

 class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
         children: [
           Expanded(
             child: Container(
               color: Colors.grey[200],
               height: 100,
               child: Center(
                 child: Image.network( "https://images.unsplash.com/photo-1608231387042-66d1773070a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                   fit: BoxFit.fill,
                 ),
               ),
             ),
           ),
           Expanded(
             child: Container(
               padding:const EdgeInsets.all(8),
               height: 100,
               child: Column(
                 mainAxisAlignment:MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("ProductName",style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),),
                       SizedBox(height: 3,),
                       Text("\$ 20.0",style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),
                    Container(
                     color: Colors.amber,
                     height: 40,
                     width: 100,
                     child: const Center(child: Text("Add to Bag",style: TextStyle(fontWeight: FontWeight.bold),)),
                   )
                 ],
               ),
             ),
           ),
         ],
       ),
     );
   }
 }
