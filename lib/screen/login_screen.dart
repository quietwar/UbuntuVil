import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:ubuntu_villages/nav_bar.dart';
import 'package:ubuntu_villages/screen/registration_screen.dart';

import '../nav_bar.dart';

enum WidgetMaker{
  login, signUP
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final  _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
        autofocus: true,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty){
            return ("Please Enter Your Email");
          }
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
            return("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value){
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(fillColor: Colors.white,
            prefixIcon: const Icon(Icons.mail),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(10),
            )
        )
    );

    final passwordField = TextFormField(
        autofocus: true,
        controller: passwordController,
        obscureText: true,
        validator: (value){
          RegExp regExp =  RegExp(r'^.{6,}$');
          if(value!.isEmpty)
            {
              return ("Password is required for login");
            }
          if(!regExp.hasMatch(value)){
            return("Please enter a valid Password (Min. 6 Characters)");
          }
          return null;
        },
        onSaved: (value){
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(fillColor: Colors.amberAccent,
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            //hintStyle: const TextStyle(color: Colors.amberAccent),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(10),
            )
        )
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailController.text,passwordController.text);
        },
        child: const Text("Login",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,),
        ),

      ),
    );


    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blackpaper.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    emailField,
                    const SizedBox(height: 25,),
                    passwordField,
                    const SizedBox(height: 20,),
                    const Text("Forget password?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                    const SizedBox(height: 20,),
                    loginButton,
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                        GestureDetector(onTap: (){

                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RegistrationScreen()));
                        },
                          child: const Text("SignUP",style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,fontSize: 20),),
                        )
                      ],
                    )
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }


  //login function
  void signIn(String? email,String? password) async
  {
    showDialog(
      context: context,
      builder: (context){
        return const Center(child:  CircularProgressIndicator());
      }
    );
    if(_formKey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login was successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const BottomNavState()))
      }).catchError((e){
      });
    }
  }
}


