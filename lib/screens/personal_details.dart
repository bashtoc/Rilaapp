import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/models/bottomnavbar.dart';
import 'package:rila/models/user_management.dart';
import '../models/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/user_management.dart';

class PersonalDetails extends StatefulWidget {
   const PersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

late  FToast fToast;
bool isLoading = false;

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  FirebaseAuth firebase = FirebaseAuth.instance;

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String address = '';


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
                height: 40,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    SizedBox(
                      width: 175,
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
                    SizedBox(
                      width: 175,
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
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field required';
                    }
                    return null;
                  },
                  decoration: ktextfield.copyWith(
                    hintText: 'address',
                    labelText: 'Address',
                  ),
                  onChanged: (value) {
                    address = value;
                  },
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
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
                     try{ if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await DbHelper().add(firstName: firstName, lastName: lastName, address: address, pendingBalance: 0);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                        setState(() {
                          isLoading = false;
                        });}}on FirebaseAuthException catch (error) {
                       fToast.showToast(
                         toastDuration: const Duration(seconds: 4),
                         child: Material(
                           color: Colors.white,
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children:  [
                               const Icon(Icons.face),
                               Text(
                                 error.message.toString(),
                                 style: const TextStyle(color: Colors.black87, fontSize: 16.0),
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
