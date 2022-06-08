import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/password_reset.dart';
import 'package:rila/screens/sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

String username = '';

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    String password = '**********';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream:
              dbCollection.doc(user?.uid).collection('MainUsers').snapshots(),
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
                    'No usernames !',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                );
              } else {return ListView.builder (
    itemCount: 1,
    reverse: false,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  ...snapshot.data!.docs.map((data) {
                    String lastName = data.get('lastName');
                    String firstName = data.get('firstName');
                    return Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Username',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              padding: const EdgeInsets.only(top: 0, left: 30),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0.0,
                                        0.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '$lastName   $firstName',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Password',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              padding: const EdgeInsets.only(top: 15, left: 30),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0.0,
                                        0.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      password,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PasswordReset()));
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                _auth.signOut();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SignIn()),
                                    (route) => false);
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ));
                  })
                ]);});
              }
            }return const Center(child:CircularProgressIndicator());
          }),
    );
  }
}
