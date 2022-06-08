import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/adminpanel/adminhomepage.dart';

import 'bottomnavbar.dart';

class DbHelper {

  CollectionReference dbCollection =
  FirebaseFirestore.instance.collection('Users');

  User? user = FirebaseAuth.instance.currentUser;

//Add personal details/ transaction details
  Future<String> add({String? lastName, int? available, double? pending, String? firstName, String? address, required int pendingBalance}) async {
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'lastName': lastName,
        'firstName': firstName,
        'address': address,
        'time': formattedDate,
        'role': 'user',
        'available': 00,
        'pending' : 00.00,
      };

      await dbCollection.doc(user!.uid).collection('MainUsers').add(data);

      return 'user Added';
    } catch (e) {
      return e.toString();
    }
  }





///update
  Future<String> update( { pendingBalance}) async {
    try {
      String formatedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'pending' : pendingBalance,

      };

      dbCollection.doc(user!.uid).collection('MainUsers').doc(user?.uid).update(data['pending']);

      return 'user Updated';
    } catch (e) {
      return e.toString();
    }
  }

  ///Logout
  signOut(){
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _auth.signOut();
  }

  ///delete
  Future<String> delete({String? id, String? title, String? story}) async {
    try {
      dbCollection.doc(user!.uid).collection('MainUsers').doc(id).delete();

      return 'User Deleted';
    } catch (e) {
      return e.toString();
    }
  }
}



authorizeAccess(BuildContext context){
   User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('Users').doc(user?.uid).collection('MainUsers').get().then((docs) {

        if(docs.docs[0].data()['role'] == 'admin'){
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AdminPanel()), (route) => false) ;
        } else{
          print('its messed up');
        }

    }
    );

}