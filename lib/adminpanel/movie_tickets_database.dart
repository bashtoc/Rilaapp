import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MovieDbHelper {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Movies');

  /// add movie slots

  Future<String> slots(
      {String? movieName,
        String? movieBanner,
      int? slotPrice,
        String? dueDate,
        int? percentageInterest,
        String? streamingPlatform,
      }) async {
    try {

      final data = {
        'movieName': movieName,
        'slotPrice': slotPrice,
        'dueDate' : dueDate,
        'percentageInterest' : percentageInterest,
        'streamingPlatform' : streamingPlatform,
        'movieBanner' : movieBanner,
      };

      await dbCollection.add(data);

      return 'user Added';
    } catch (e) {
      return e.toString();
    }
  }

  /// add ticket slots

  Future<String> tickets({
    int? ticketPrice,
    String? ticketBanner,

  }) async {
    try {
      String formattedDate = DateFormat.yMMMd().format(DateTime.now());
      final data = {
        'ticket price': ticketPrice,
        'ticketBanner' : ticketBanner,
        'date' :  formattedDate,
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
          .update(data);

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
