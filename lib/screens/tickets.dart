import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/paystackgateway.dart';

import '../models/constants.dart';
 String? tickets;
class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('tickets');
  String moviesBanner = 'assets/moviesBanner.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: buttonColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tickets',
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
                  'No tickets added yet !',
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
                        int ticketPrice = data.get('ticket price');

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
                                      //
                                      // const SizedBox(width: 10,),
                                      Container(
                                        width: 150,
                                        height: 70,
                                        margin: const EdgeInsets.only(
                                            left: 40, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Ticket Price',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'NGN $ticketPrice',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
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
                                            MakePayment(
                                              ctx: context,
                                              price: ticketPrice, id: tickets ,
                                            ).chargeCardAndMakePayment();
                                            // something happens when pressed *//
                                          },
                                          child: const Text(
                                            'Buy Ticket',
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
