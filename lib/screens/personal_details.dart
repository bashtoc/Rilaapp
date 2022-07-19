import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rila/models/bottomnavbar.dart';
import 'package:rila/models/user_management.dart';

import '../models/constants.dart';
import '../models/user_management.dart';



class PersonalDetails extends StatefulWidget {
  const PersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

late FToast fToast;
bool isLoading = false;
bool showLoading = false;

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  FirebaseAuth firebase = FirebaseAuth.instance;
  String verificationId = '';

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String address = '';
  final phoneController = TextEditingController();



//   verification() async {
//
//       setState(() {
//         showLoading = true;
//       });
//
//       try {
//         await _auth.verifyPhoneNumber(
//           phoneNumber: phoneController.text,
//           verificationCompleted: (phoneAuthCredential) async {
//             setState(() {
//               showLoading = false;
//             });
//           },
//           verificationFailed: (verificationFailed) async {
//             setState(() {
//               showLoading = false;
//             });
//             _scaffoldKey.currentState?.showSnackBar(SnackBar(
//                 content: Text(
//                     verificationFailed.message.toString())));
//           },
//           codeSent: (verificationId, resendingToken) async {
//             setState(() {
//               showLoading = false;
//                showAlertDialog(context);
//               this.verificationId = verificationId;
//             });
//           },
//           codeAutoRetrievalTimeout: (verificationId) async {},
//         );
//       } on Exception catch (e) {
//         print(e);
//       }
//
// }








  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 2,
        dismissible: false,
        progressIndicator: const CircularProgressIndicator(
          color: buttonColor,
        ),
        opacity: 0.4,
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: buttonColor,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/eevee.png'),
                  radius: 43,
                ),
              ),
              TextButton(
                child: const Text(
                  'change',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    SizedBox(
                      width: 170,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field required';
                          }
                          return null;
                        },
                        decoration: ktextfield.copyWith(
                          hintText: 'first name',
                          labelText: 'first name',
                        ),
                        onChanged: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field required';
                          }
                          return null;
                        },
                        decoration: ktextfield.copyWith(
                          hintText: 'Last name',
                          labelText: 'last name',
                        ),
                        onChanged: (value) {
                          lastName = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field required';
                          }
                          return null;
                        },
                        decoration: ktextfield.copyWith(
                          hintText: 'phone',
                          labelText: 'phone',
                        ),
                        controller: phoneController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      child: const Text(
                        'verify',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed:(){}
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   margin: const EdgeInsets.only(
              //     left: 20,
              //     right: 20,
              //   ),
              //   child: TextFormField(
              //     autovalidateMode: AutovalidateMode.onUserInteraction,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'field required';
              //       }
              //       return null;
              //     },
              //     decoration: ktextfield.copyWith(
              //       hintText: 'address',
              //       labelText: 'Address',
              //     ),
              //     onChanged: (value) {
              //       address = value;
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: buttonColor,
                      ),
                      child: const Text(
                        'finish',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor, onPrimary: buttonColor),
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await DbHelper().addUser(
                              firstName: firstName,
                              lastName: lastName,
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar()));
                          setState(() {
                            isLoading = false;
                          });
                        }
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
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

showAlertDialog(BuildContext context) {
  final otpController = TextEditingController();

  String verificationId = '';
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel", style: TextStyle(color: buttonColor)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue", style: TextStyle(color: Colors.green)),
    onPressed: () async {
      PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text);

      /// here to add Text form filed editor
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Verify number"),
    content: SizedBox(
      height: 100,
      child: Column(
        children: [
          const Text("Enter code  to verify"),
          TextFormField(
            onChanged: (value) {},
          ),
        ],
      ),
    ),
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
