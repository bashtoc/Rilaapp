import 'package:flutter/material.dart';
import 'package:rila/adminpanel/listmoviepage.dart';
import 'package:rila/adminpanel/withdrawalrequest.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/models/user_management.dart';
import 'package:rila/screens/sign_in.dart';

import '../models/user_management.dart';
import 'addticket.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text(
            'Admin Panel', style: TextStyle(color: buttonColor),
          ),
          const SizedBox(
            width: 80,
          ),
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: buttonColor,
              ),
              onPressed: () {
                // set up the button
                Widget action = TextButton(
                  child: const Text("OppK"),
                  onPressed: () {},
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout"),
                  actions: [
                    action = TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    action = TextButton(
                        onPressed: () {
                          DbHelper().signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const SignIn()),
                                  (route) => false);
                        },
                        child: const Text('yes')),
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }),
        ]),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListMovie()));

                },
                child: Image.asset(
                  'assets/listmovieadmin.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WithDraw()));
                },
                child: Image.asset(

                  'assets/withdrawalrequests.png',
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
                onTap: (){
                   },
                child: Image.asset(
                  'assets/searchuser.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTicket()));

                },
                child: Image.asset(
                  'assets/addticket.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
