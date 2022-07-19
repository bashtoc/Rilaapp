import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/buy_apple_playstore_downloads.dart';
import 'package:rila/screens/buy_likes_and_comments.dart';
import 'package:rila/screens/buy_playstore_downloads.dart';
import 'package:rila/screens/buy_shares.dart';
import 'package:rila/screens/buy_tiktok_video_promotion.dart';
import 'package:rila/screens/buy_views_and_comment.dart';
import 'package:rila/screens/buy_whatsapp_status_promotion.dart';
import 'package:rila/screens/buyfollowers.dart';
import 'package:rila/screens/orders.dart';

import 'buy_likes.dart';
import 'buy_retweet.dart';
import 'buy_subscribers.dart';

class BoostSocials extends StatefulWidget {
  const BoostSocials({Key? key}) : super(key: key);

  @override
  _BoostSocialsState createState() => _BoostSocialsState();
}

String followPrice = '5';
String sharePrice = '15';
String likesPrice = '5';
String videoPrice = '500';
String whatsAppPostPrice = '30';
String retweetPrice = '15';
String subscribePrice = '50';
String viewsLikeAndComment = '30';
String likesAndCommentPrice = '20';
String appleReviewAndCommentPrice = '100';
String googleReviewAndCommentPrice = '80';

String currency(context) {
  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

class _BoostSocialsState extends State<BoostSocials> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Boost socials',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 30,
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orders()));
                  },
                  child: const Text('Orders')),
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),

                child: ListTile(

                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyFollowers()));
                  },
                  leading: Image.asset(
                    'assets/social.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Buy real Instagram, Tiktok, Twitter and Facebook followers. costs ${currency(context)}$followPrice per ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const TextSpan(
                            text: 'follow',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyShares()));
                  },
                  leading: Image.asset(
                    'assets/facebook.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Buy real facebook shares. costs ${currency(context)}$sharePrice per  ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const TextSpan(
                            text: 'Share',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyLikes()));
                  },
                  leading: Image.asset(
                    'assets/social.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy real instagram, tiktok, facebook and twitter post likes costs ${currency(context)}$likesPrice per '),
                        const TextSpan(
                            text: 'Like',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyRetweets()));
                  },
                  leading: Image.asset(
                    'assets/tweeter.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy real and authentic twitter retweets costs ${currency(context)}$retweetPrice per'),
                        const TextSpan(
                            text: ' retweet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuySubscribers()));
                  },
                  leading: Image.asset(
                    'assets/youtube.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy real youtube subscribers costs ${currency(context)}$subscribePrice per'),
                        const TextSpan(
                            text: ' subscription',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyLikesAndComments()));
                  },
                  leading: Image.asset(
                    'assets/social.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy real instagram, tiktok, facebook and twitter likes and comments costs ${currency(context)}$likesAndCommentPrice per '),
                        const TextSpan(
                            text: 'Like and Comment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyMusicPromo()));
                  },
                  leading: Image.asset(
                    'assets/tiktok.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Promote your Song or product on tiktok videos  costs ${currency(context)}$videoPrice per'),
                        const TextSpan(
                            text: ' video',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const YoutubeViewAndComment()));
                  },
                  leading: Image.asset(
                    'assets/youtube.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy real views and comment on youtube videos costs ${currency(context)}$viewsLikeAndComment per'),
                        const TextSpan(
                            text: ' view and comment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PromoteOnWhatsappStatus()));
                  },
                  leading: Image.asset(
                    'assets/whatsapp.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Promote products on whatsapp status costs ${currency(context)}$whatsAppPostPrice per'),
                        const TextSpan(
                            text: ' Post',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyGooglePlayReview()));
                  },
                  leading: Image.asset(
                    'assets/playstore.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy app reviews and comments on google playStore costs ${currency(context)}$googleReviewAndCommentPrice per'),
                        const TextSpan(
                            text: ' Download, Review and comment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyAppleDownloads()));
                  },
                  leading: Image.asset(
                    'assets/appstore.png',
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Buy app reviews and comments on apple appStore  costs ${currency(context)}$appleReviewAndCommentPrice per'),
                        const TextSpan(
                            text: ' Download, Review and comment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
