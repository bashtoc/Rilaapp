import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/screens/social_earn_page.dart';

import '../models/constants.dart';
import 'buy_apple_playstore_downloads.dart';

class SocialEarn extends StatefulWidget {
  const SocialEarn({
    Key? key,
  }) : super(key: key);

  @override
  _SocialEarnState createState() => _SocialEarnState();
}

String currency(context) {
  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

final value = NumberFormat("#,##0.00", "en_US");

String amount = '1000';
String refAmount = '500';

class _SocialEarnState extends State<SocialEarn> {
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
            'Become a member',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Make money while enjoying the cruise on social media,'
                            'become a member by paying a one'
                            ' time membership fee of ${currency(context)}${value.format(int.parse(amount))} and enjoy the following benefits'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            '•  Turn your social media accounts and phone into a money making machine,'
                            '  earn money from following accounts and liking posts, you have been doing it '
                            'for free, now is time to earn money from it.'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            '•  Perform tasks like following accounts or pages on social media,'
                            '  creating a tiktok video with songs, posting ads on whatsapp status, app downloads,'
                            ' subscribing to youtube channels, sharing posts on facebook and twitter retweets.'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            '•  Watch exclusive contents only for our members,'
                            ' there is more you can do and more to come.'),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '•  Earn money from our referral program,'
                            ' You will earn instant ${currency(context)}${value.format(int.parse(refAmount))} when someone signs up with your referral code'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    followNumber = int.parse(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid number';
                    }

                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: ktextfield.copyWith(
                    labelText: 'Enter your referral code?',
                    hintText: 'Enter your referral code?',
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffC55E14), width: 1.0),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              color: const Color(0xffC55E14),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SocialEarnPage()));
                    // makePayment(context);
                    // MakePayment(
                    //   price: 60,
                    //   ctx: context,    )
                    //     .chargeCardAndMakePayment();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Become a member, pay ${currency(context)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          value.format(int.parse('1000')),
                          style: const TextStyle(color: Colors.white),
                        )
                      ])),
            ),
          ],
        ));
  }
}
