import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/personal_details.dart';
import 'package:rila/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String id = 'signup';

  @override
  State<SignUp> createState() => _SignUpState();
}
late FToast fToast;
bool isLoading = false;



class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email ='';

  late String password ='';


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
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign up',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 2,
        dismissible: false,
        progressIndicator: const CircularProgressIndicator(
          color: buttonColor,
        ),
        opacity: 0.4,
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          onChanged: (value){email = value;},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'field required';
                            }
                            return null;
                          },
                          decoration: ktextfield.copyWith(
                              hintText: 'Enter your email', labelText: 'Email'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          onChanged: (value){
                            password = value;
                          },
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: const [
                            Text('By signing up, you agree to our '),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {

                          },
                          child: const Text(
                            'Terms and conditions',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: buttonColor, onPrimary: buttonColor),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {

                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (_) => const PersonalDetails()),
                                        (route) => false);
                                // something happens when its pressed
                              } on FirebaseAuthException catch (error) {
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
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 65,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: buttonColor,
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (_) => const SignIn()),
                                        (route) => false);

                                //do something when pressed.
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// TextFormField(
// autovalidateMode: AutovalidateMode.onUserInteraction,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'field required';
// }
// return null;
// },
// decoration: ktextfield.copyWith(
// hintText: 'Enter username ',
// labelText: 'Name',
// ),
// ),