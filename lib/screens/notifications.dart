import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rila/classes/notifications_classes.dart';

class Notifi extends StatefulWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  _NotifiState createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
  final List<NotificationHistory> notificationHistory = [
    NotificationHistory(
        depositNotificationDescription: 'Deposit..127gdhtev',
        depositIcon: 'assets/deposit.svg',
        withdrawalIcon: 'assets/withdrawal.svg',
        withdrawalPrice: 25400,
        depositPrice: 25400,
        withdrawalNotificationDescription: 'withdrawal..127gdhtev', dateTime: 'DateTime.now'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 15,
                  bottom: 15,
                ),
                color:  const Color(0xffEDEDED),
                child: Row(
                  children: [
                    SvgPicture.asset(notificationHistory[index].depositIcon,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(notificationHistory[index]
                        .depositNotificationDescription),
                    const SizedBox(
                      width: 120,
                    ),
                    Text(notificationHistory[index].depositPrice.toString())
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 15,
                  bottom: 15,
                ),
                color:  Colors.white,
                child: Row(
                  children: [
                    SvgPicture.asset(notificationHistory[index].withdrawalIcon,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(notificationHistory[index]
                        .withdrawalNotificationDescription),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(notificationHistory[index].withdrawalPrice.toString())
                  ],
                ),
              )]);
          },
          itemCount: notificationHistory.length,
        ));
  }
}
