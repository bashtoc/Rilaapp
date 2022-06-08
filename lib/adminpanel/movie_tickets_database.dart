import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MovieDbHelper {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Movies');

  /// add movie slots

  Future<String> slots(
      {String? movieName,
      int? slotPrice,
        String? dueDate,
        int? percentageInterest,
        String? streamingPlatform,
      }) async {
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'movieName': movieName,
        'date': formattedDate,
        'slotPrice': slotPrice,
        'dueDate' : dueDate,
        'percentageInterest' : percentageInterest,
        'streamingPlatform' : streamingPlatform,
      };

      await dbCollection.add(data);

      return 'user Added';
    } catch (e) {
      return e.toString();
    }
  }

  /// add ticket slots

  Future<String> tick({
    int? ticketPrice,
  }) async {
    try {
      final data = {
        'ticket price': ticketPrice,
      };

      await FirebaseFirestore.instance.collection('tickets').add(data);

      return 'user Added';
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

      dbCollection
          .doc()
          .collection('MainUsers')
          .doc(id)
          .set(data, SetOptions(merge: true));

      return 'user Updated';
    } catch (e) {
      return e.toString();
    }
  }

  ///delete
  Future<String> delete({String? id, String? title, String? story}) async {
    try {
      dbCollection.doc().delete();

      return 'movie  Deleted';
    } catch (e) {
      return e.toString();
    }
  }
}
