// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/reusable_widgets/reusable_widget.dart';
// import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/signin_screen.dart';
import 'package:myapp/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // Text editing controllers for email, username, and password text fields
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,      // Extend body behind app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(     // SingleChildScrollView to make content scrollable
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),


                // Firebase UI button widget for signing up
                firebaseUIButton(context, "Sign Up", () {

                  // Access FirebaseAuth instance
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,       //Get email from text field
                          password: _passwordTextController.text)  //Get password from text field

                      //handle successful login
                      .then((value) {
                    print("Created New Account");

                    // Navigate to sign-in screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()));
                  })
                  //handle error
                  .onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }
}