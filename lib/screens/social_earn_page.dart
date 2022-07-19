import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../models/constants.dart';
class SocialEarnPage extends StatefulWidget {
  const SocialEarnPage({Key? key}) : super(key: key);

  @override
  _SocialEarnPageState createState() => _SocialEarnPageState();
}


bool swich =false;


class _SocialEarnPageState extends State<SocialEarnPage> {
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
          'Social earn',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ToggleSwitch(
                  minWidth: 160.0,
                  minHeight: 20.0,
                  fontSize: 14.0,
                  initialLabelIndex: swich ? 1 : 0,
                  activeBgColor: const [buttonColor],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.grey[900],
                  totalSwitches: 2,
                  labels: const [
                    'New Tasks',
                    'completed task',
                  ],
                  onToggle: (index) {
                    setState(() {
                      swich = !swich;
                    });
                  }),
            ],
          ),
          const SizedBox(height: 20,),
          Column(
            children: [
              swich? const NewTasks(): const CompletedTask()
            ],
          )
        ],
      ));

  }
}



class NewTasks extends StatefulWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  _NewTasksState createState() => _NewTasksState();
}

String  currency(context) {

  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

String tweeter = 'assets/tiktok.png';
class _NewTasksState extends State<NewTasks> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('hello')
    );
  }
}



class CompletedTask extends StatelessWidget {
  const CompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 20),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: Row(children: [

                      SizedBox(
                          height: 50,
                          child: Image.asset('assets/tiktok.png')),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Make a tiktok video with a song'),
                          Text('You earn: ${(currency(context))}300 ')
                        ],
                      ),

                    ],),
                  ),
                  const SizedBox(width: 15,),
                  const Icon(Icons.arrow_forward_ios)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

