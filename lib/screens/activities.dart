import 'package:flutter/material.dart';
import 'package:rila/classes/Activities_class.dart';
import 'package:rila/classes/movie_class.dart';
import 'package:rila/models/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);
  static String id = 'activities_Screen';

  @override
  State<Activities> createState() => _ActivitiesState();
}

List<Widget> labels = [
  const TicketDetails(),
  const Slots(),
];

class _ActivitiesState extends State<Activities> {
  final List<MoviesDashboard> moviesDashboard = [
    MoviesDashboard(
        movieName: 'Witches Den',
        movieType: 'Series',
        productionCost: 120000.0,
        slotPrice: 4000.0)
  ];

  final List<ActivitiesHistory> activitiesHistory = [
    ActivitiesHistory(
      description: 'withdrawal description',
      amount: 24345.0,
      depositIcon: 'deposit image',
      withdrawIcon: 'withdrawIcon',
      slots: 12,
      due: '12 april 22',
    )
  ];

  int counter = 0;

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
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Activities',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                  minWidth: 100.0,
                  minHeight: 30.0,
                  fontSize: 16.0,
                  initialLabelIndex: 0,
                  activeBgColor: const [buttonColor],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.grey[900],
                  totalSwitches: 2,
                  labels: const [
                    'Slots',
                    'Tickets',
                  ],
                  onToggle: (index) {
                    setState(() {
                      counter = index!;
                    });
                  }),
            ],
          ),
          Column(
            children: [
              labels[counter],
            ],
          ),
        ],
      ),
    );
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(' hey, you just bought a ticket'),
      ),
    );
  }
}

class Slots extends StatelessWidget {
  const Slots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('you bought  a slot, woww'),
    );
  }
}
