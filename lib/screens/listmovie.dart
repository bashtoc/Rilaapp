import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';

class ListMovie extends StatefulWidget {
   const ListMovie({Key? key} ) : super(key: key);

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  String contactNumber = '08122213751';

  String contactEmail = 'hello@rilastudio.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        icon:  const Icon(Icons.arrow_back,
          color: Colors.black,
        ), onPressed: () {
        Navigator.pop(context);
      },
      ),

        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "How to list a movie ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(left: 40, right: 30),
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(
              height: 20,
            ),
            const Text('Hello, chief,',style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text(
                'Over the years, content creation has  advanced, with Nigeria taking the lead in Africa, though challenges cannot be overlooked of which funding is one of it.    ', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text(' We understand the business of content creation so we provide a platform for you to enhance your film making and content creation level. write your story and worry less about financing it, list your movie for free, and gain the finance to produce it from slots and subscriptions. Give a percentage of your stream back to the subscribers, interesting right?',style: textfieldstyler),

            const SizedBox(
              height: 10,
            ),
            const Text(
                'If your movie costs one million in production, you would be required to remit one million and a percentage alongside, 10% and above after sales …', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text('Requirements: Registered business name.', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text(
                'distribution channel, (Netflix, Cinema, Youtube, Amazon prime)', style: textfieldstyler),
            const Text(' A signed movie MOU', style: TextStyle(fontSize: 18)),
            const Text('A banner, size( with:365, height: 118))', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            Text('for more Enquiries, contact: $contactNumber, $contactEmail', style: textfieldstyler)



          ],
        ),
      )),
    );
  }
}
