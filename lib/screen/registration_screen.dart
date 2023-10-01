import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ubuntu_villages/model/user_model.dart';
import 'package:ubuntu_villages/nav_bar.dart';
//import 'package:ubuntu_villages/widget/services/common.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final firstNameTextEditingController = TextEditingController();
  final secondNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameTextEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regExp = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First name can not be empty");
          }
          if (!regExp.hasMatch(value)) {
            return ("Enter a valid name (Min. 3 Characters)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameTextEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "first Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameTextEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second name can not be empty");
          }

          return null;
        },
        onSaved: (value) {
          secondNameTextEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Second Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final emailField = TextFormField(
        autofocus: false,
        controller: emailTextEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valiid email");
          }
          return null;
        },
        onSaved: (value) {
          emailTextEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordTextEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regExp = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regExp.hasMatch(value)) {
            return ("Please enter a valid Password (Min. 6 Characters)");
          }
          return null;
        },
        onSaved: (value) {
          passwordTextEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordTextEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordTextEditingController.text !=
            passwordTextEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordTextEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.amberAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailTextEditingController.text,
                passwordTextEditingController.text);
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blackpaper.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
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
                    firstNameField,
                    const SizedBox(
                      height: 25,
                    ),
                    secondNameField,
                    const SizedBox(
                      height: 25,
                    ),
                    emailField,
                    const SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 25,
                    ),
                    confirmPasswordField,
                    const SizedBox(
                      height: 25,
                    ),
                    loginButton,
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String? email, String? password) async {
    showDialog(
        context: context,
        builder: (context){
          return const Center(child:  CircularProgressIndicator());
        }
    );
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: "Account created successfully");
      });
      //await CommonUtil.backendCall(userCredential.user!, CommonUtil.stripeUserCreate)
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const BottomNavState()));

    }
  }

  postDetailsToFirestore() async {
    //calling on  fire store
    //calling user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameTextEditingController.text;
    userModel.secondName = secondNameTextEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
  }

}
