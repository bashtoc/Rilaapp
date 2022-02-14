import 'package:flutter/material.dart';

class WithDrawAmount extends StatefulWidget {
 const WithDrawAmount({Key? key}) : super(key: key);

  @override
  State<WithDrawAmount> createState() => _WithDrawAmountState();
}

class _WithDrawAmountState extends State<WithDrawAmount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String withDrawAmount = '';

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
    return  Scaffold(
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
          'Withdraw amount',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    withDrawAmount = value;
                  },
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
