import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/password_reset.dart';
import 'package:rila/screens/sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}



String username = '';
late FToast fToast;
bool isLoading = false;
class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Users');





  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }


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
              } else {
                return ListView.builder(
                    itemCount: 1,
                    reverse: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        ...snapshot.data!.docs.map((data) {
                          String lastName = data.get('lastName');
                          String firstName = data.get('firstName');
                          return Container(
                              margin:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Column(
                                children: [



                                  const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: buttonColor,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                                     radius: 43,
                                    ),
                                  ),
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
                                    height: 60,
                                    padding:
                                        const EdgeInsets.only(top: 0, left: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 7.0,
                                          spreadRadius: 1.0,
                                          offset: const Offset(0.0, 1.0), // shadow direction: bottom right
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

                                      ],
                                    ),
                                  ),const SizedBox(
                                    height: 30,
                                  ),Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Bank',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    padding:
                                    const EdgeInsets.only(top: 0, left: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 7.0,
                                          spreadRadius: 1.0,
                                          offset: const Offset(0.0, 1.0), // shadow direction: bottom right
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

                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
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
                                    height: 60,
                                    padding: const EdgeInsets.only(
                                         left: 30),
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 7.0,
                                          spreadRadius: 1.0,
                                          offset: const Offset(0.0, 1.0),// shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          password,
                                        ),

                                        const SizedBox(width: 160,),

                                        TextButton(
                                          onPressed: () {

                                            showAlertDialog(context);

                                          },
                                          child: const Text(
                                            'Reset',
                                            style: TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    ),
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
                      ]);
                    });
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}









showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel",style: TextStyle(color:buttonColor)),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue", style: TextStyle(color: Colors.green)),
    onPressed:  () {
     Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordReset()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Password Reset"),
    content: const Text("You are initiating a password reset"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




