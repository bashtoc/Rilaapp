
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/models/bottomnavbar.dart';
import 'package:rila/screens/signup_screen.dart';

import '../adminpanel/adminhomepage.dart';

class NavSelector extends StatefulWidget {
  const NavSelector({Key? key}) : super(key: key);

  @override
  State<NavSelector> createState() => _NavSelectorState();
}

class _NavSelectorState extends State<NavSelector> {


  @override
  Widget build(BuildContext context) {

    ///
    Future.delayed(const Duration(seconds: 0), () {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('MainUsers').get().then((docs) {
        if(docs.docs.isEmpty){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUp()), (route) => false);
        }

        if(docs.docs[0].data()['role'] == 'admin'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AdminPanel()), (route) => false) ;
        } else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBar()), (route) => false);
        }

      }
      );
    });
    return  Container(
      color: Colors.white,
      child: const Center(
          child: CircularProgressIndicator()),
    );
    }
  }

