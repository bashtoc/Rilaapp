import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rila/classes/notifications_classes.dart';
import 'package:intl/intl.dart';

class HomepageNotificationExtension extends StatelessWidget {
  HomepageNotificationExtension({Key? key}) : super(key: key);

  final List<NotificationHistory> notificationHistory = [
    NotificationHistory(
        depositNotificationDescription: 'Deposit..127gdhtev',
        depositIcon: 'assets/deposit.svg',
        withdrawalIcon: 'assets/withdrawal.svg',
        withdrawalPrice: 25400,
        depositPrice: 25400,
        withdrawalNotificationDescription: 'withdrawal..127gdhtev',
        dateTime: DateFormat('dd-MM-yy     KK:mm a').format(DateTime.now()))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    notificationHistory[index].dateTime,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                         ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              height: 50,
              padding: const EdgeInsets.only(
                left: 10,
                top: 15,
                bottom: 15,
              ),
              color: const Color(0xffEDEDED),
              child: Row(
                children: [
                  SvgPicture.asset(
                    notificationHistory[index].depositIcon,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(notificationHistory[index]
                      .depositNotificationDescription),
                  const SizedBox(
                    width: 100,
                  ),
                  Text(
                    notificationHistory[index].depositPrice.toString(),
                    style: const TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    notificationHistory[index].dateTime,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.only(
                left: 35,
                top: 15,
                bottom: 15,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    notificationHistory[index].withdrawalIcon,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(notificationHistory[index]
                      .withdrawalNotificationDescription),
                  const SizedBox(
                    width: 80,
                  ),
                  Text(notificationHistory[index].withdrawalPrice.toString())
                ],
              ),
            ),Column(children: [
            const SizedBox(
          height: 10,
          ),
          Container(
          margin: const EdgeInsets.only(left: 25),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(
          notificationHistory[index].dateTime,
          style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
          ),
          ),
          ],
          ),
          ),
          Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          height: 50,
          padding: const EdgeInsets.only(
          left: 10,
          top: 15,
          bottom: 15,
          ),
          color: const Color(0xffEDEDED),
          child: Row(
          children: [
          SvgPicture.asset(
          notificationHistory[index].depositIcon,
          ),
          const SizedBox(
          width: 20,
          ),
          Text(notificationHistory[index]
              .depositNotificationDescription),
          const SizedBox(
          width: 100,
          ),
          Text(
          notificationHistory[index].depositPrice.toString(),
          style: const TextStyle(color: Colors.green),
          )
          ],
          ),
          ),
          Container(
          margin: const EdgeInsets.only(left: 25),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(
          notificationHistory[index].dateTime,
          style: const TextStyle(
          fontSize: 12,
          color: Colors.black54),
          ),
          ],
          ),
          ),
          Container(
          height: 50,
          padding: const EdgeInsets.only(
          left: 35,
          top: 15,
          bottom: 15,
          ),
          color: Colors.white,
          child: Row(
          children: [
          SvgPicture.asset(
          notificationHistory[index].withdrawalIcon,
          ),
          const SizedBox(
          width: 20,
          ),
          Text(notificationHistory[index]
              .withdrawalNotificationDescription),
          const SizedBox(
          width: 80,
          ),
          Text(notificationHistory[index].withdrawalPrice.toString())
          ],
          ),
          )
          ])
          ]);

        },
        itemCount: notificationHistory.length,
      ),
    );
  }
}
