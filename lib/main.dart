// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/todo_provider.dart';
import 'package:myapp/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyALEwumgy02iotxCqj3WziStXabI3m3ZdU",
      appId: "1:418419492442:android:62d878e940918731fefa63",
      messagingSenderId: "418419492442",
      projectId: "fir-1821c",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        home: SignInScreen(),
      ),
    );
  }
}