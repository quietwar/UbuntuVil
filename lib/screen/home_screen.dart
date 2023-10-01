import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_villages/model/user_model.dart';
import 'market.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = ["1", "2"];

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Hello",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${loggedInUser.firstName}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                      const Text(
                        "Welcome to ubuntu villages ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //banner
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.grey[400],
                  height: 200,
                  width: double.infinity,
                  // child: Image.network("https://images.unsplash.com/photo-1535642147056-37b87c7e3042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwzNTQwOTY1fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //search field
              // GestureDetector(
              //   onTap: (){
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SearchScreen()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(18),
              //       color: Colors.white,
              //         boxShadow: const [
              //           BoxShadow(
              //               offset: Offset(0,3),
              //               blurRadius: 5,
              //               color: Colors.black26
              //           )
              //         ]
              //     ),
              //     height: 45,
              //     width: double.infinity,
              //     child: Padding(
              //         padding:const EdgeInsets.all(8),
              //         child: Row(
              //           children: const [
              //             Text("Search  your items here",style: TextStyle(color: Colors.grey
              //             ,fontSize: 15
              //             ),),
              //             Spacer(),
              //             Icon(Icons.search,size: 25,color: Colors.grey,)
              //           ],
              //         ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              //row for services
              const Row(
                children: [
                  Text(
                    "Our Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const MarketScreen()));                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.amber,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0,3),
                            blurRadius: 5,
                            color: Colors.black26
                        )
                      ]
                  ),
                  height: 45,
                  width: double.infinity,
                  child: const Padding(
                      padding:EdgeInsets.all(8),
                      child: Text("See ubuntu latest market item",style: TextStyle(color: Colors.black
                      ,fontSize: 20
                      ),),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext  context, int index){
                    return const Card(child:  Text("home card"),);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
