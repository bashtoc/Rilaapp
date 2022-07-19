import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/screens/depositAmount.dart';
import 'package:rila/screens/signup_screen.dart';
import 'package:rila/screens/tickets.dart';
import 'package:rila/screens/v_t_u.dart';
import 'package:rila/screens/withdraw_amount.dart';

import 'boost_socials.dart';
import 'listmovie.dart';
import 'social_earn.dart';

double available =0;

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
    required this.firstName,
  }) : super(key: key);

  final String firstName;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

 String lastName ='';


String currency(context) {
  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}
final value = NumberFormat("#,##0.00", "en_US");

class _DashBoardState extends State<DashBoard> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    String walletBackground = 'assets/rectangle.png';

    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference dbCollection =
        FirebaseFirestore.instance.collection('Users');

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Hello bash!',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_alert,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 12.5),
                    child: Image.asset(walletBackground)),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
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
                  height: 160,
                  width: 300,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 40),
                    child: Row(
                      children:  [
                        const SizedBox(
                          width: 80,
                        ),
                        Text(
                          '${currency(context)} ${value.format(int.parse('23457'))}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 130, left: 0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Column(
                        children:  [
                          const Text(
                            'Earnings ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${currency(context)} ${value.format(int.parse('23457'))}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 170, top: 130),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Column(
                        children:  [
                          const Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${currency(context)} ${value.format(int.parse('23457'))}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const DashImages()
          ],
        ),
      ]),
    ));
  }
}

class DashImages extends StatelessWidget {
  const DashImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(
          height: 5,
        ), Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>  WithDrawAmount(lastName: lastName, availableBalance: available, firstName: firstName)));
              },
              child: Image.asset(
                'assets/withdraw.png',
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const DepositAmount()));
              },
              child: Image.asset(
                'assets/fund.png',
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SocialEarn()));
              },
              child: Image.asset(
                'assets/socialearn.png',
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tickets()));
              },
              child: Image.asset(
                'assets/ticket.png',
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const VTU()));
              },
              child: Image.asset(
                'assets/airtime.png',
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const BoostSocials()));
              },
              child: Image.asset(
                'assets/buyfollow.png',
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ListMovie()));
              },
              child: Image.asset(
                'assets/listmovie.png',
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const BoostSocials()));
              },
              child: Image.asset(
                'assets/Refer.png',
                height: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
