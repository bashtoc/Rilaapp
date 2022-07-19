import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rila/models/bottomnavbar.dart';

import '../models/constants.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';

  late FToast fToast;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        elevation: 0,
        title: const Text(
          'Password Rest',
          style: TextStyle(color: Colors.white),
        ),
      ),
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
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email ',
                    labelText: 'Email',
                    labelStyle: TextStyle(color: buttonColor),
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                        'Reset',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor, onPrimary: buttonColor),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      if (_formKey.currentState!.validate()) {
                        try {
                          await _auth.sendPasswordResetEmail(email: email);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) =>  const ResetNotifi()),
                                  (route) => false);
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
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetNotifi extends StatelessWidget {
  const ResetNotifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => BottomNavBar()),
              (route) => false);
    });

    //
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/Vector.svg',
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Password Reset successful',
              style: TextStyle(color: Color(0xff0A720E)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('A link has been sent to your email'),
            const SizedBox(
              height: 10,
            ),
            const Text('follow the link to reset your password'),
          ],
        ),
      ),
    );
  }
}
