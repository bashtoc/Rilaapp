
import 'package:rila/classes/authentic_classes.dart';
import 'package:rila/screens/signup_screen.dart';
import '../models/constants.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
   const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
  String email = 'vowsnig@gmail.com';
  String adminEmail = ' vowsnig@gmail.com';
  String password = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      keyboardType:  TextInputType.emailAddress,
                      validator: validatePass,
                      controller: _controller,
                      decoration: ktextfield.copyWith(
                          hintText: 'Enter your email',
                         labelText: 'Email',
                      ),
                      onChanged: (value){
                       email = value;
                      },

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatePass,
                      decoration: ktextfield.copyWith(
                        hintText: 'Select Password',
                        labelText: 'Password',
                      ),
                      onChanged: (value){
                        password = value;
                      },
                    ),
                    const SizedBox(height: 30),
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {


                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SignUp()));


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
    );
  }
}
