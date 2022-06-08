import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/listmovie.dart';
import 'package:rila/screens/tickets.dart';
import 'package:rila/screens/withdraw_amount.dart';
import 'activities.dart';
import 'notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.firstName, }) : super(key: key);

  final String firstName;



  @override
  State<Home> createState() => _HomeState();
}


late final String lastName;

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {

    String walletBackground = 'assets/rectangle.svg';
    String activities = 'assets/activities.svg';
    String listMovies = 'assets/listmovie.svg';

    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference dbCollection =
        FirebaseFirestore.instance.collection('Users');

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(

          stream: dbCollection.doc(user?.uid).collection('MainUsers').snapshots(),
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
                return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      ...?snapshot.data?.docs.map((data) {
                        String? firstName = data.get('firstName');
                        String? lastName = data.get('lastName');
                        int? available = data.get('available');
                        double? pending = data.get('pending');

                        return Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Hello $firstName !',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Notifi()));
                                      },
                                      child: const Icon(
                                        Icons.add_alert,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  SvgPicture.asset(walletBackground),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 120, top: 10),
                                    child: const Text(
                                      'Wallet Balance',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    height: 120,
                                    width: 300,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 00, left: 10),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Available ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            available.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    height: 140,
                                    width: 300,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 60, left: 10),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Pending',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            pending.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 140, left: 125),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     WithDrawAmount(availableBalance: available!, firstName: firstName.toString(), lastName: lastName.toString(),)));
                                      },
                                      child: const Text(
                                        'Withdraw',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Activities()));
                                          // do something when pressed
                                        },
                                        child: SvgPicture.asset(activities)),
                                    GestureDetector(
                                        onTap: () {
                                          // do something when pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ListMovie()));
                                        },
                                        child: SvgPicture.asset(listMovies)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 180,
                              decoration: containerDecoration,
                              alignment: Alignment.center,
                              child: const Text(
                                'No current tickets, watch out ',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Tickets()),
                                );
                              },
                              child: const Text(
                                'See all tickets',
                                style: TextStyle(color: buttonColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
