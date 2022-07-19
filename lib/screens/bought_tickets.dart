import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoughtTickets extends StatefulWidget {
  const BoughtTickets({Key? key}) : super(key: key);

  @override
  _BoughtTicketsState createState() => _BoughtTicketsState();
}

User? user = FirebaseAuth.instance.currentUser;
CollectionReference activityCollection =
FirebaseFirestore.instance.collection('Activities');

String moviesBanner = 'assets/moviesBanner.jpeg';
int? ticketPrice = 0;

class _BoughtTicketsState extends State<BoughtTickets> {
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
        title: const Text(
          'Bought Tickets',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: activityCollection.doc(user!.uid).collection('TicketActivities').snapshots(),
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
                  'No tickets bought yet !',
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
                        String dateTime = data.get('date');


                        return
                          Column(
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
                                      offset: Offset(0.0, 1.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),

                                child: Stack(children: [
                                  Positioned(

                                    child: SvgPicture.asset('assets/good.svg', height: 70,),bottom: 10, left: 150,),
                                  Column(
                                    children: [
                                      Image.asset(moviesBanner),
                                      Row(
                                        children: [
                                          //
                                          // const SizedBox(width: 10,),
                                          Container(
                                            width: 150,
                                            height: 70,
                                            margin: const EdgeInsets.only(left: 40, top: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Container(
                                            width: 150,
                                            height: 70,
                                            margin: const EdgeInsets.only(left: 20, top: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Date',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  ' $dateTime',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
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
      )
    );
  }
}


