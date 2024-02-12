// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/reusable_widgets/reusable_widget.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/reset_password.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/utils/color_utils.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Text editing controllers for email and password text fields
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Set container width to screen width
        height: MediaQuery.of(context)
            .size
            .height, // Set container width to screen width
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          // SingleChildScrollView to make content scrollabl
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              // Column widget to arrange children vertically
              children: <Widget>[
                // List of children widgets
                logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  //For creating empyt spaces
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),

                forgetPassword(
                    context), // Widget to handle forgot password option
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance //Access FirebaseAuth instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController
                              .text, // Get email from text field
                          password: _passwordTextController
                              .text) // Get password from text field
                      .then((value) {
                    //handle successful login
                    // Navigate to home screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }).onError((error, stackTrace) {
                    // ignore: avoid_print
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for the sign-up option
  Row signUpOption() {
    // Row widget to arrange children horizontally
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),

        // GestureDetector widget to handle taps
        GestureDetector(
          onTap: () {
            // Navigate to sign-up screen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // Widget for the forgot password option
  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight, // Align text to bottom right
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),

        // Handle button press to navigate to reset password screen
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }
}
