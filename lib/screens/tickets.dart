import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/bought_tickets.dart';
import 'package:rila/screens/buy_tickets_now.dart';

import '../models/constants.dart';

String tickets = 'tickets';

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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Tickets',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              width: 70,
            ),
            SizedBox(
              height: 30,
              width: 85,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BoughtTickets()));
                  },
                  child: const Text('Bought')),
            )
          ],
        ),
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
                        String ticketBanner = data.get('ticketBanner');
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 360,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 70.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(0.0,
                                        10.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    height: 118,
                                    width: 356,
                                    imageUrl: ticketBanner,
                                    placeholder: (context, url) =>
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Center(
                                            child:
                                            CircularProgressIndicator(
                                              color: buttonColor,
                                            ))),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                  // Image.network(ticketBanner,height: 118, width: 356,) ,
                                  Row(
                                    children: [
                                      //
                                      // const SizedBox(width: 10,),
                                      Container(
                                        width: 90,
                                        height: 70,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Regular',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '$ticketPrice',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'VIP',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '$ticketPrice',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 70,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'VVIP',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '$ticketPrice',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 70,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Tables',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '$ticketPrice',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (
                                              context) => const BuyTicketsNow()));
                                    },
                                    child: const Text('Buy now'),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                        ),
                                        primary: const Color(0xffC55E14)),
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
