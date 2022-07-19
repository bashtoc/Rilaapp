import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/screens/buy_apple_playstore_downloads.dart';


class DepositAmount extends StatefulWidget {
  const DepositAmount({Key? key}) : super(key: key);

  @override
  _DepositAmountState createState() => _DepositAmountState();
}


String  currency(context) {

  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

TextEditingController currencyController = TextEditingController();
String formNum(String s) {
  return NumberFormat.decimalPattern().format(
    int.parse(s),
  );
}

final value = NumberFormat("#,##0.00", "en_US");

class _DepositAmountState extends State<DepositAmount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Deposit amount',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              const SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black.withOpacity(0.6)),),
                  const SizedBox(height: 10,),
                  Container(

                    decoration:  BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: const Border(

                      ),
                    ),
                    child:  TextFormField(
                      style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18, color: Colors.black.withOpacity(0.7)),

                      controller: currencyController,
                      decoration: InputDecoration(
                        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: const BorderSide(color: Colors.grey, )),
                        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),

                        prefix: Text('    ${currency(context)} '),),
                      keyboardType: TextInputType.number,
                      onChanged: (string) {
                        string = formNum(
                          string.replaceAll(',', '', ),
                        );
                        currencyController.value = TextEditingValue(
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
              const SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: const Color(0xffC55E14),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Proceed to deposit',
                      style: TextStyle(color: Colors.white),
                    )),
              ),

            ])));
  }
}
