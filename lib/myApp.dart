import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_4/pages/create_Store.dart';
import 'package:project_4/pages/first_Page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
      setState(() {
        print('Is there any any user? $isLoggedIn');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const CreateStore() : const FirstPage(),
    );
  }
}
