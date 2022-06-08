import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ActivityDb {
  CollectionReference activityCollection =
  FirebaseFirestore.instance.collection('Activities');

  User? user = FirebaseAuth.instance.currentUser;

  /// add activity

  Future<String> addActivity(
      {String? movieName,
        // String? movieType,
        int? slotPrice,
        // String? productionCost
      }) async {
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'movieName': movieName,
        'date': formattedDate,
        'slotPrice': slotPrice,
      };

      await activityCollection.doc(user!.uid).collection('userActivities').add(data);

      return 'activity Added';
    } catch (e) {
      return e.toString();
    }
  }



  ///update
  Future<String> update({String? id, String? title, String? story}) async {
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'title': title,
        'story': story,
        'time': formattedDate,
      };

      activityCollection
          .doc()
          .collection('userActivities')
          .doc(id)
          .set(data, SetOptions(merge: true));

      return 'Activity Updated';
    } catch (e) {
      return e.toString();
    }
  }

  ///delete
  Future<String> delete({String? id, String? title, String? story}) async {
    try {
      activityCollection.doc().delete();

      return 'Activity  Deleted';
    } catch (e) {
      return e.toString();
    }
  }
}
