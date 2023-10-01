//import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ubuntu_villages/nav_bar.dart';
import 'package:ubuntu_villages/screen/login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //stripe setup
  //final String  response = await rootBundle.loadString("assets/config/stripe.json");
  //final data = await json.decode(response);
  //Stripe.publishableKey = data["publishableKey"];


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ubuntu village',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home:  StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return const BottomNavState();
                }else {
                  return const LoginScreen();
                }
              }
          )
      );
  }
}

