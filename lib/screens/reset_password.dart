// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/reusable_widgets/reusable_widget.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // Controller for the email text field
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(

          // Set container width to screen width
          width: MediaQuery.of(context).size.width,

          // Set container height to screen height
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],
                  begin: Alignment.topCenter, // Start gradient from top center
                  end:
                      Alignment.bottomCenter)), // End gradient at bottom center

          // SingleChildScrollView to make content scrollable
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", () {

                  // Firebase UI button widget for resetting password
                  FirebaseAuth.instance

                      // Send password reset email
                      .sendPasswordResetEmail(email: _emailTextController.text)

                      // Navigate back to previous screen after sending email
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ))),
    );
  }
}
