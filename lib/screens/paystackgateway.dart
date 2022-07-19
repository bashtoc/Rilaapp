import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:flutterwave_standard/view/flutterwave_style.dart';
import 'package:rila/adminpanel/activity_database.dart';
import 'package:rila/classes/paystackkey.dart';
import 'package:rila/models/bottomnavbar.dart';
import 'package:rila/screens/slot_details.dart';
import 'package:rila/screens/tickets.dart';

import '../adminpanel/activity_database.dart';

const snackBar1 = SnackBar(content: Text('transaction successful'));
const snackBar2 = SnackBar(content: Text('transaction failed'));

class MakePayment {
  MakePayment({
    required this.ctx,
    required this.price,
    this.id,
    this.interest,
    this.dueDate,
    this.movieName,
    this.date,
    this.ticketPrice,
  });

  successResult(BuildContext context) {
    if (id == slotDetails) {
      ActivityDb().addSlot(
        slotPrice: price,
        dueDate: dueDate,
        interest: interest,
        movieName: movieName,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      if (id == tickets) {
        ActivityDb().addTickets(
          ticketPrice: price,
        );
      }
    }
  }

  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashBoard()), (route) => false);
  // print('no way man');

  BuildContext ctx;
  int price;
  String? id;
  double? interest;
  String? dueDate;
  String? movieName;
  String? date;
  int? ticketPrice;

  PaystackPlugin payStack = PaystackPlugin();
  //reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //Get ui
  PaymentCard _getCardUI() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await payStack.initialize(publicKey: ConstantKey.payStackKey);
  }

  User? user = FirebaseAuth.instance.currentUser;

  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = (price * 100)
        ..email = user?.email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await payStack.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.bank,
          fullscreen: true,
          logo: Image.asset(
            'assets/rila logo.png',
            height: 30,
            width: 30,
          ));
      if (response.status == true) {
        successResult(ctx);

        // ScaffoldMessenger.of(ctx).showSnackBar(snackBar1);
        // print('transaction was successful');
      } else {
        return const SnackBar(content: Text('transaction failed'));
        // print('Transaction Failed',);
      }
    });
  }
}

makePayment(context) async {
  final style = FlutterwaveStyle(
      buttonColor: Colors.white,
      appBarIcon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
      buttonTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      appBarColor: Colors.white,
      dialogCancelTextStyle: const TextStyle(
        color: Colors.redAccent,
        fontSize: 18,
      ),
      dialogContinueTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 18,
      ));
  final Customer customer =
      Customer(name: "", phoneNumber: "", email: "customer@customer.com");

  final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey: "FLWPUBK_TEST-e8d4cd5462fb381c4163ba7f7f746a98-X",
      currency: "NGN",
      txRef: "unique_transaction_reference",
      amount: "3000",
      customer: customer,
      paymentOptions: "ussd, card, barter, payattitude",
      customization: Customization(title: "Test Payment"),
      isTestMode: false);

  final ChargeResponse response = await flutterwave.charge();

  if (response.status == 'success') {
    'reb';
  } else {
    "  Transaction not successful";
  }
}
