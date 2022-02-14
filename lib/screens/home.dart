import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rila/screens/addamount.dart';
import 'package:rila/screens/listmovie.dart';
import 'package:rila/screens/withdraw_amount.dart';
import 'activities.dart';
import 'notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String username = '';
    String availableBalance = 'NGN 24,356.02';
    String pendingBalance = '';
    String walletBackground = 'assets/rectangle.svg';
    String activities = 'assets/activities.svg';
    String listMovies = 'assets/listmovie.svg';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 23, right: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        username,
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
                                  builder: (context) => const Notifi()));
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
                  height: 15,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(walletBackground),
                    Container(
                      margin: const EdgeInsets.only(left: 120, top: 10),
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
                        margin: const EdgeInsets.only(top: 00, left: 10),
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
                              availableBalance,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      height: 140,
                      width: 300,
                      child: Container(
                        margin: const EdgeInsets.only(top: 60, left: 10),
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
                              pendingBalance,
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
                      margin: const EdgeInsets.only(top: 140, left: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddAmount()));
                        },
                        child: const Text(
                          'Deposit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 140, left: 235),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WithDrawAmount()));
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
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Activities()));
                            // do something when pressed
                          },
                          child: SvgPicture.asset(activities)),
                      GestureDetector(
                          onTap: () {
                            // do something when pressed
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListMovie()));
                          },
                          child: SvgPicture.asset(listMovies)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
