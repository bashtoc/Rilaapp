
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/Navigator_selector.dart';
import 'package:rila/screens/signup_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    ///
    Future.delayed(const Duration(seconds: 3), () {
      if (user == null) {

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) =>  const SignUp()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const NavSelector()),
              (route) => false);
      }
    });

    //
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/rila logo.png',
        fit: BoxFit.contain,
      )),
    );
  }
}
