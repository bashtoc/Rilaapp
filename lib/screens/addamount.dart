import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:rila/classes/paystackkey.dart';
import 'package:rila/screens/paystackgateway.dart';



class AddAmount extends StatefulWidget {
  const AddAmount({Key? key}) : super(key: key);

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  dynamic depositAmount = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = 'vowsnig@gmail.com';

  String? validatePass(value) {
    {
      if (value!.isEmpty) {
        return 'Invalid amount';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Deposit amount',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 100),
          height: 200,
          width: 400,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    depositAmount = int.parse(value);
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter amount',
                  ),
                  validator: validatePass,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {



                  if (_formKey.currentState!.validate()) {
                    try {
                      MakePayment(
                        ctx: context,
                        price: depositAmount,
                      ).chargeCardAndMakePayment();

                      // something happens when its pressed
                    } catch (e) {
                      print(e);
                    }
                  }
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
      ),
    );
  }
}



