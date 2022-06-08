import 'package:flutter/material.dart';
import 'package:rila/screens/paystackgateway.dart';

const snackBar2 = SnackBar(content: Text('insufficient funds'));

class WithDrawAmount extends StatefulWidget {
  const WithDrawAmount(
      {Key? key, required this.lastName, required this.availableBalance, required this.firstName})
      : super(key: key);
  final String firstName;
  final int availableBalance;
  final String lastName;
  @override
  State<WithDrawAmount> createState() => _WithDrawAmountState();
}

class _WithDrawAmountState extends State<WithDrawAmount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int withDrawAmount = 0;
  int accountNo = 0;
  String bankName = '';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 40),
          width: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'balance: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const Text(
                    ' NGN',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.availableBalance.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        withDrawAmount = int.parse(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter amount',
                      ),
                      validator: validatePass,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        accountNo = int.parse(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Account Number',
                      ),
                      validator: validatePass,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,

                      onChanged: (value) {
                        bankName = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Bank Name',
                      ),
                      validator: validatePass,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(widget.firstName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:18), ),
                   const SizedBox(width: 10,),
                   Text(widget.lastName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:18),),
                 ],
               ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {

                  if (_formKey.currentState!.validate()) {
                    try {
                      if (withDrawAmount <= widget.availableBalance) {
                        print('sucess');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                        ;
                      }

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
