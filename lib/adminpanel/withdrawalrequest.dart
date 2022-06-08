import 'package:flutter/material.dart';

import '../models/constants.dart';

class WithDraw extends StatelessWidget {
  const WithDraw({Key? key}) : super(key: key);

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
          'withdrawal requests',
          style: TextStyle(color: buttonColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.only(top: 25),
          height: 120,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              spreadRadius: 0.0,
              offset: Offset(0.0, 0.0), // shadow direction: bottom right
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text(
                    'firstName',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'lastName',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text(
                    'Account No.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'number',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text(
                    ' amount',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'amount',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text(
                    ' Bank',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Uba',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
