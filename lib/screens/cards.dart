import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/demo.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  String accountNumber = '1234567890';

  String bankName = 'figma bank';

  String cardDetails = 'UBA 4567234***';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          ' Bank Details',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Bank Details',
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
              padding: const EdgeInsets.only(top: 15, left: 10),
              decoration: containerDecoration,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text('Account No.'),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(accountNumber),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text('Bank Name.'),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(bankName),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
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
                  'Card',
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
              padding: const EdgeInsets.only(top: 15, left: 10),
              decoration: containerDecoration,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Text(
                      cardDetails,
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
                  'BVN',
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
              padding: const EdgeInsets.only(top: 15, left: 10),
              decoration: containerDecoration,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Text(
                      cardDetails,
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

                   

                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
