import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rila/screens/paystackgateway.dart';

import '../models/constants.dart';

String slotDetails = 'slotDetails';

class SlotDetails extends StatefulWidget {
  const SlotDetails({
    Key? key,
    required this.movieName,
    required this.slotPrice,
    required this.streamingPlatform,
    required this.percentageInterest,
    required this.dueDate,
  }) : super(key: key);

  final String? dueDate;
  final double? percentageInterest;
  final String? streamingPlatform;
  final String? movieName;
  final int slotPrice;
  static const styler = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static const styler2 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: buttonColor);
  static const color = Colors.red;
  @override
  State<SlotDetails> createState() => _SlotDetailsState();
}

class _SlotDetailsState extends State<SlotDetails> {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Movies');

  String? movieName;
  @override
  Widget build(BuildContext context) {

    // slotMaturity() {
    //   if( true > dif)
    // };




    int slotPrice = widget.slotPrice;
    movieName = widget.movieName!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: buttonColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: const Text(
            'Slot Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: buttonColor),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Movie name: ',
                        style: SlotDetails.styler,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$movieName',
                        style: SlotDetails.styler2,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Streaming platform: ',
                        style: SlotDetails.styler,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.streamingPlatform.toString(),
                        style: SlotDetails.styler2,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Slot due date: ',
                        style: SlotDetails.styler,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.dueDate.toString(),
                        style: SlotDetails.styler2,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Interest: NGN',
                        style: SlotDetails.styler,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        ' ${widget.percentageInterest.toString()}',
                        style: SlotDetails.styler2,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'SlotPrice: NGN '.toString(),
                        style: SlotDetails.styler,
                      ),
                      Text(
                        slotPrice.toString(),
                        style: SlotDetails.styler2,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: buttonColor,
                          padding: const EdgeInsets.only(
                              left: 100, top: 20, bottom: 20, right: 100)),
                      onPressed: () {
                        MakePayment(
                                ctx: context, price: slotPrice, id: slotDetails, interest: widget.percentageInterest, dueDate: widget.dueDate, movieName: movieName, )
                            .chargeCardAndMakePayment();
                      },
                      child: const Text('Proceed to payment')),
                ],
              ),
            ],
          ),
        ));




  }


}
