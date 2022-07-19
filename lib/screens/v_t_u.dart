import 'package:flutter/material.dart';
import 'package:rila/screens/boost_socials.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../models/constants.dart';

class VTU extends StatefulWidget {
  const VTU({Key? key}) : super(key: key);

  @override
  _VTUState createState() => _VTUState();
}



bool swich =false;
class _VTUState extends State<VTU> {
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
          'Airtime and Data',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleSwitch(
                minWidth: 150.0,
                minHeight: 25.0,
                fontSize: 14.0,
                initialLabelIndex: swich ? 1 : 0,
                activeBgColor: const [buttonColor],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.grey[900],
                totalSwitches: 2,
                labels: const [
                  'Airtime',
                  'Data',
                ],
                onToggle: (index) {
                  setState(() {
                    swich = !swich;
                  });
                }),
          ],
        ),
        const SizedBox(height: 25,),
        Column(children: [
          swich ?  const Airtime() : const Data()
        ])

      ],)
    );
  }
}



class Airtime extends StatefulWidget {
  const Airtime({Key? key}) : super(key: key);

  @override
  _AirtimeState createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              width: 180,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset(
                        'assets/mtn.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '1000 MTN Airtime',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Price: ${currency(context)}980',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.red)))),
                          onPressed: () {},
                          child: const Text('Buy'),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 180,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset(
                        'assets/mtn.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '1000 MTN Airtime',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Price: ${currency(context)}980',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.red)))),
                          onPressed: () {},
                          child: const Text('Buy'),
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}





class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              width: 180,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset(
                        'assets/mtn.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '1000 MTN Airtime',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Price: ${currency(context)}980',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.red)))),
                          onPressed: () {},
                          child: const Text('Buy'),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 180,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset(
                        'assets/mtn.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '1000 MTN Airtime',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Price: ${currency(context)}980',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.red)))),
                          onPressed: () {},
                          child: const Text('Buy'),
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
