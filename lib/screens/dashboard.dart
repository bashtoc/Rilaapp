import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/slot_details.dart';
import '../models/constants.dart';

String? dashboard;

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Movies');




  @override
  Widget build(BuildContext context) {
    String moviesBanner = 'assets/moviesBanner.jpeg';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Movie Slots',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: dbCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              }
              return const Center(
                child: Text(
                  'No movie slots added yet !',
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: 1,
                reverse: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ...snapshot.data!.docs.map((data) {

                        String dueDate = data.get('dueDate');
                        String streamingPlatform = data.get('streamingPlatform');
                        int percentageInterest = data.get('percentageInterest');
                        String movieName = data.get('movieName');
                        int slotPrice = data.get('slotPrice');


                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 360,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 7.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0,
                                        1.0), // shadow direction: bottom right
                                  )
                                ],
                              ),

                              // decoration: BoxDecoration(
                              //
                              //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10)) ,
                              // ),
                              child: Column(
                                children: [
                                  Image.asset(moviesBanner),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        width: 120,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Name',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Text(
                                              movieName,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // const SizedBox(width: 10,),
                                      Container(
                                        width: 110,
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'SlotPrice',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Text(
                                              'NGN $slotPrice',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            primary: buttonColor,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => SlotDetails(
                                                  movieName: movieName,
                                                  slotPrice: slotPrice, streamingPlatform: streamingPlatform, dueDate: dueDate, percentageInterest: percentageInterest.toString(),

                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Buy slot',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //another hard coded list
                          ],
                        );
                      }),
                    ],
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
