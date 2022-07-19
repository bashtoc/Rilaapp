import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/register_earn_page.dart';
import 'package:rila/screens/signup_screen.dart';
import 'package:rila/screens/splash_screen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
     home:Splash(),

    );
  }
}



