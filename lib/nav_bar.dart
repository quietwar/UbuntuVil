

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_villages/screen/check_out_screen.dart';
import 'package:ubuntu_villages/screen/home_screen.dart';
import 'package:ubuntu_villages/screen/profile_screen.dart';
import 'package:ubuntu_villages/screen/shop_screen.dart';

import 'model/user_model.dart';


class BottomNavState extends StatefulWidget {
  const BottomNavState({Key? key}) : super(key: key);

  @override
  State<BottomNavState> createState() => _BottomNavStateState();
}

class _BottomNavStateState extends State<BottomNavState> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      loggedInUser = UserModel.fromMap(value.data());
      setState((){
      });
    });
}

  int currentIndex = 0;

  final screen = [
    const HomeScreen(),
    const ShopScreen(),
    const BagScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) => setState(()=>currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline_rounded),label: "Bag"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),label: "My PLT"),
        ],
      ),
    );
  }
}

