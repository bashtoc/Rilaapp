import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../models/bottomnavbar.dart';

const snackBar2 = SnackBar(content: Text('insufficient funds'));

class WithDrawAmount extends StatefulWidget {
  const WithDrawAmount(
      {Key? key,
      required this.lastName,
      required this.availableBalance,
      required this.firstName})
      : super(key: key);
  final String firstName;
  final double availableBalance;
  final String lastName;
  @override
  State<WithDrawAmount> createState() => _WithDrawAmountState();
}

String currency(context) {
  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

String formNum(String s) {
  return NumberFormat.decimalPattern().format(
    int.parse(s),
  );
}

TextEditingController currencyController = TextEditingController();

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
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),

                child: Column(children: [

                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Enter amount',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6)),
                                  ), const SizedBox(width: 70),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'balance: ',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),

                                      Text(
                                        '${currency(context)} ${widget.availableBalance.toString()}',
                                        style:
                                        const TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  // border: const Border(),
                                ),
                                child: TextFormField(

                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.7)),
                                  controller: currencyController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        )),
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 25.0, horizontal: 10.0),
                                    prefix: Text('    ${currency(context)} '),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (string) {
                                    string = formNum(
                                      string.replaceAll(
                                        ',',
                                        '',
                                      ),
                                    );
                                    currencyController.value =
                                        TextEditingValue(
                                      text: string,
                                      selection: TextSelection.collapsed(
                                        offset: string.length,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffC55E14),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            try {
                              if (withDrawAmount < widget.availableBalance ||
                                  widget.availableBalance > 499) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WithdrawNotifi()),
                                    (route) => false);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar2);
                              }

                              // something happens when its pressed
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          color: const Color(0xffC55E14),
                          child: TextButton(
                              onPressed: () {},
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'withdraw ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ])),
                        ),
                      ),
                    ]),
                  )
                ]))));
  }
}

class WithdrawNotifi extends StatelessWidget {
  const WithdrawNotifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => BottomNavBar()), (route) => false);
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
              'Withdraw request  successful',
              style: TextStyle(color: Color(0xff0A720E)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('your cash will be in your bank soon'),
          ],
        ),
      ),
    );
  }
}
