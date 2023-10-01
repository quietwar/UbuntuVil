//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:ubuntu_villages/screen/login_screen.dart';
//
// import '../model/user_model.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();
//
//   @override
//   void initState(){
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value){
//       loggedInUser = UserModel.fromMap(value.data());
//       setState((){});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 200,
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 150,
//                     color: Colors.black,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 30,left: 16,right: 16),
//                       child: Column(
//                         children: [
//                           Row(mainAxisAlignment: MainAxisAlignment.end,
//                             children: const [
//                               Icon(Icons.edit_outlined,color: Colors.white,),
//                             ],),
//                           Row(children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[100],
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               height: 70,
//                               width: 70,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text("${loggedInUser.firstName}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
//                                      const SizedBox(width: 5,),
//                                       Text("${loggedInUser.secondName}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
//                                     ],
//                                   ),
//                                   Text("${loggedInUser.email}",style: const TextStyle(color: Colors.white,fontSize: 17),),
//                                 ],),
//                             ),
//                           ],)
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
//               child: Text("Payment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//             ),
//             Container(
//               width: double.infinity,
//               height: 200,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.red,
//                               child:const Icon(Icons.wallet_membership,color: Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("Payment method",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.deepPurple,
//                               child: const Icon(Icons.account_balance_wallet_rounded,color: Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("My Wallet",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.deepOrangeAccent,
//                               child: const Icon(Icons.addchart,color:Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("Add Money",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//
//
//             const Padding(
//               padding: EdgeInsets.only(left: 10,bottom: 10),
//               child: Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//             ),
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.blue,
//                               child:const Icon(Icons.wysiwyg,color: Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("About Us",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.red,
//                               child: const Icon(Icons.question_mark,color: Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("FAQ",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                     child: Container(color: Colors.white,
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               color: Colors.deepOrange,
//                               child:const Icon(Icons.alternate_email,color: Colors.white,),
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Text("Contact us",style: TextStyle(fontSize: 15),),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const Padding(
//               padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
//               child: Text("Other",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//             ),
//             GestureDetector(
//               onTap: (){
//                 logout(context);
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 60,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 2,left: 8,top: 8,right: 8),
//                       child: Container(color: Colors.white,
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 color: Colors.red,
//                                 child:const Icon(Icons.logout,color: Colors.white,),
//                               ),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             const SizedBox(width: 10,),
//                             const Text("Logout",style: TextStyle(fontSize: 15),),
//                             const Spacer(),
//                             const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Future<void> logout(BuildContext context) async
//   {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
//   }
// }
//
//



import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget listTile({required IconData icon, required String? title}){
    return Column(
      children: [
       const Divider(height: 1,),
        ListTile(
          leading:Icon(icon),
          title:Text(titleLarge),
          trailing:const  Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 160,
                color: Colors.orangeAccent,
              ),
              Container(
                height: 500,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                         padding: const EdgeInsets.only(left: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("John Doe",style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("example@gmail.com")
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.orangeAccent,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.edit),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                        icon: Icons.shop_outlined,
                        title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery  Address"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Refer A friend"),listTile(
                        icon: Icons.shop_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.policy_outlined,
                        title: "Privacy Policy"),
                    listTile(
                        icon: Icons.add_chart,
                        title: "About"),
                    listTile(
                        icon: Icons.shop_outlined,
                        title: "Log Out"),
                  ],
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 100,left: 30),
            child: CircleAvatar(
              radius: 50,
              child: CircleAvatar(
                radius: 45,
                backgroundColor:Colors.grey,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
