import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/Termsandconditions.dart';
import 'package:rila/screens/sign_in.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  static String id = 'signup';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validatePass(value) {
    {
      if (value!.isEmpty) {
        return 'field required';
      } else {
        return null;
      }
    }
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: validatePass,
                        decoration: ktextfield.copyWith(
                            hintText: 'Enter your email', labelText: 'Email'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePass,
                        decoration: ktextfield.copyWith(
                          hintText: 'Enter username ',
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePass,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermsAndConditions(),
                            ),
                          );
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            try {
                              // something happens when its pressed
                            } catch (e) {
                              print(e);
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ),
                              );

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
    );
  }
}
