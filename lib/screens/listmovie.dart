import 'package:flutter/material.dart';
import 'package:rila/models/constants.dart';

class ListMovie extends StatefulWidget {
   const ListMovie({Key? key} ) : super(key: key);

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  String contactNumber = '08122213751';

  String contactEmail = 'info@rilastudio.co';

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
                'Become a creator offers an opportunity to aspiring content creators to join us in creating amazing contents and telling their stories on our youtube channels', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text(' It could be difficult starting out as a content creator, we offer you an established platform to tell your story and earn alongside',style: textfieldstyler),

            const SizedBox(
              height: 10,
            ),
            const Text(
                'we pay you 70% of of every of your video earnings on our youtube channel ', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text('your video becomes an exclusive content of rilastudios and entertainment limited.', style: textfieldstyler),
            const SizedBox(
              height: 10,
            ),
            const Text(
                'make a one time registration fee to get started', style: textfieldstyler),

            Text('for more Enquiries, contact: $contactNumber, $contactEmail', style: textfieldstyler),
          const SizedBox(height: 40,),

            SizedBox(
              width: 400,
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffC55E14),
                    padding: const EdgeInsets.all(20),

                  ),
                  onPressed: (){}, child: const Text('Pay NGN 20,000 to register')),
            )
          ],
        ),
      )),
    );
  }
}
