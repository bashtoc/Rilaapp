import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/constants.dart';
import '../models/constants.dart';

class RegisterEarnPage extends StatefulWidget {
  const RegisterEarnPage({Key? key}) : super(key: key);

  @override
  _RegisterEarnPageState createState() => _RegisterEarnPageState();
}

String dropDownValue = 'Twitter';
var items = [
  'Twitter',
];






String  currency(context) {

  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

class _RegisterEarnPageState extends State<RegisterEarnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: buttonColor,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                      radius: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    width: 106,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {},
                        child: Text(
                          'add image',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
           Container(
             margin: const EdgeInsets.only(left: 20, right: 20),
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text(
                   'which state do you live in?',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                       color: Colors.black54),
                 ),
                 const SizedBox(
                   height: 10,
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
                             dropDownValue = value!;
                           });
                         },
                         items: items
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
                         value: dropDownValue,
                         hint: const Text('select platform'),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),  const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'what is your gender?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
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
                              dropDownValue = value!;
                            });
                          },
                          items: items
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
                          value: dropDownValue,
                          hint: const Text('select platform'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'what is your religion?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
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
                              dropDownValue = value!;
                            });
                          },
                          items: items
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
                          value: dropDownValue,
                          hint: const Text('select platform'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: const Color(0xffC55E14),
              child: TextButton(
                  onPressed: () {

                  },
                  child:  const Text(
                    'Finish ',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
