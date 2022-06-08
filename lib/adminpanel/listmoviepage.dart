import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/adminpanel/adminhomepage.dart';
import 'package:rila/models/constants.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:rila/screens/dashboard.dart';

import '../screens/personal_details.dart';

import 'movie_tickets_database.dart';

class ListMovie extends StatefulWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int slotPrice =0;
  String? movieName;
  String? dueDate;
  String? streamingPlatform;
  int? percentageInterest;
  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

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
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'List movie',
          style: TextStyle(color: buttonColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 22, right: 22),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      height: 118,
                      width: 365,
                      decoration: containerDecoration),
                  const SizedBox(
                    height: 30,
                  ),

                  /// movie name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      movieName = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ('movie name'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///due date
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      dueDate = value;
                    },

                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ('due date'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///percentage Interest
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      percentageInterest = int.parse(value);
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ('percentage Interest'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// slot price
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      slotPrice = int.parse(value);
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ('slot price'),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  ///streaming platform
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      streamingPlatform = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ('streaming Platform'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: buttonColor,
                      ),
                      child: const Text(
                        'list movie',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor, onPrimary: buttonColor),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await MovieDbHelper().slots(
                            movieName: movieName,
                            slotPrice: slotPrice,
                            dueDate: dueDate,
                            percentageInterest: percentageInterest,
                            streamingPlatform: streamingPlatform,

                          );

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AdminPanel()),
                              (route) => false);
                          // something happens when its pressed
                        } on FirebaseAuthException catch (error) {
                          fToast.showToast(
                            toastDuration: const Duration(seconds: 4),
                            child: Material(
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.face),
                                  Text(
                                    error.message.toString(),
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                            gravity: ToastGravity.TOP,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                      // something happens when its pressed
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashBoard()));
                      },
                      child: const Text(
                        'See listed movies',
                        style: TextStyle(color: buttonColor),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
