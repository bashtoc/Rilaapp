

import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
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

  static String id = 'profile';

  @override
  Widget build(BuildContext context) {
    String username = '';
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
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Username',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
            decoration: containerDecoration,
            child: Row(
              children: [
                Text(
                  username,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title:
                            const Text('Username', textAlign: TextAlign.center),
                        content: SizedBox(
                          height: 200,
                          width: 350,
                          child: Column(
                            children: [
                              Form(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                key: _formKey,
                                child: TextFormField(
                                    textAlign: TextAlign.center,

                                  validator: validatePass,
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(

                                    hintText: 'Enter username',
                                  ),
                                  onChanged: (value){
                                    username = value;
                                  }
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                onPressed: () {


                                  if (_formKey.currentState!.validate()) {
                                  }
                                      // something happens when its pressed
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 110,
                                  child: const Text(
                                    'continue',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
            decoration: containerDecoration,
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
                  widget(context);
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}


widget(BuildContext context){

  int password = 0;
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
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:
        const Text('Password', textAlign: TextAlign.center),
        content: SizedBox(
          height: 200,
          width: 350,
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: TextFormField(
                    textAlign: TextAlign.center,

                    validator: validatePass,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(

                      hintText: 'Enter password',
                    ),
                    onChanged: (value){
                      password = int.parse(value);
                    }
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {


                  if (_formKey.currentState!.validate()) {
                  }
                  // something happens when its pressed
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 110,
                  child: const Text(
                    'continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

}