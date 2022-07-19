import 'package:flutter/material.dart';
import 'package:rila/screens/results_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

TextStyle styler2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87.withOpacity(0.6));

final Uri _url = Uri.parse('https://flutter.dev');
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

class _OrdersState extends State<Orders> {
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
            'Your orders',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 220,
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 70.0,
                  spreadRadius: 0.0,
                  offset:
                      const Offset(0.0, 10.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order: 300 youtube subscribers',
                          style: styler2,
                        ),
                        SizedBox(
                            width: 50,
                            child: Image.asset('assets/youtube.png')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: #50',
                          style: styler2,
                        ),
                        SizedBox(
                          height: 30,
                          child: TextButton(

                            onPressed: _launchUrl,
                            child: Text('Your link: ${_url.toString()}'),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price: #4,000',
                      style: styler2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: styler2,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: const Text(
                            'In review',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            color: buttonColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No. of subscribers: 300',
                      style: styler2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResultsPage()));
                      },
                      child: const Text('See Results'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          primary: const Color(0xffC55E14)),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
