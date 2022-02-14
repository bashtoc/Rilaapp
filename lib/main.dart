import 'package:flutter/material.dart';
import 'package:rila/models/bottomnavbar.dart';
import 'package:rila/screens/sign_in.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
     home:BottomNavBar(),

    );
  }
}
