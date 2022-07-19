import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/screens/paystackgateway.dart';

import '../models/constants.dart';
import 'buy_apple_playstore_downloads.dart';

class BuyTicketsNow extends StatefulWidget {
  const BuyTicketsNow({Key? key}) : super(key: key);

  @override
  _BuyTicketsNowState createState() => _BuyTicketsNowState();
}

String dropDownValue7 = 'Instagram';
var items7 = [
  'Instagram',
  'Tiktok',
  'Twitter',
  'Facebook',
];

String currency(context) {
  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

class _BuyTicketsNowState extends State<BuyTicketsNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
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
          'Buy Tickets',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Select Ticket grade',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: movieContainerDecoration.copyWith(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        dropDownValue7 = value!;
                      });
                    },
                    items: items7
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: dropDownValue7,
                    hint: const Text('select platform'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              color: const Color(0xffC55E14),
              child: TextButton(
                  onPressed: () {
                    makePayment(context);
                    // MakePayment(
                    //   price: 60,
                    //   ctx: context,    )
                    //     .chargeCardAndMakePayment();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Make payment, ${currency(context)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          value.format(int.parse('1000')),
                          style: const TextStyle(color: Colors.white),
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
