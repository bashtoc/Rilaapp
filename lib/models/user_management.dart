import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DbHelper {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Users');

  User? user = FirebaseAuth.instance.currentUser;

  ///Add personal details/ transaction details
  Future<String> addUser(
      {String? lastName,
      double? available,
      String? firstName,
      String? address,
     }) async {
    String? docId = dbCollection.doc(user!.uid).id;
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'lastName': lastName,
        'firstName': firstName,
        // 'address': address,
        'time': formattedDate,
        'role': 'user',
        // 'available': 00.00,
        // 'id': docId,
      };

      await dbCollection
          .doc(user!.uid)
          .collection('MainUsers')
          .doc(docId)
          .set(data);

      return 'user Added';
    } catch (e) {
      return e.toString();
    }
  }

  ///update
  Future<String> update({
    double? available,
  }) async {
    String? docId = dbCollection.doc(user!.uid).id;
    try {
      final data = {
        'available': available,
      };

      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('MainUsers')
          .doc(docId)
          .update(data);

      return 'user Updated';
    } catch (e) {
      return e.toString();
    }
  }

  ///Logout
  signOut() {
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
