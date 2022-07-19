import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rila/screens/Navigator_selector.dart';
import 'package:rila/screens/signup_screen.dart';

import '../models/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late FToast fToast;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  String email = '';
  String adminEmail = ' ';
  String password = '';
  final TextEditingController _controller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 2,
        dismissible: false,
        progressIndicator: const CircularProgressIndicator(
          color: buttonColor,
        ),
        opacity: 0.4,
        color: Colors.white,
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field required';
                          }
                          return null;
                        },
                        controller: _controller,
                        decoration: ktextfield.copyWith(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field required';
                          }
                          return null;
                        },
                        decoration: ktextfield.copyWith(
                          hintText: 'Select Password',
                          labelText: 'Password',
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: buttonColor, onPrimary: buttonColor),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final newUser = await _auth
                                  .signInWithEmailAndPassword(
                                      email: email, password: password)
                                  .then((user) =>  Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => const NavSelector()),
                                      (route) => false));
                              if (newUser != null) {
                                print('success');
                              }
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
                                            color: Colors.black87,
                                            fontSize: 16.0),
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
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: buttonColor,
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (_) => const SignUp()),
                                        (route) => false);

                                //do something when pressed.
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
