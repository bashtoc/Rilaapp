
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:rila/adminpanel/activity_database.dart';
import 'package:rila/classes/paystackkey.dart';
import 'package:rila/models/user_management.dart';
import 'package:rila/screens/activities.dart';
import 'package:rila/screens/profile.dart';
import 'package:rila/screens/slot_details.dart';
import 'package:rila/screens/tickets.dart';

import '../adminpanel/adminhomepage.dart';
import '../models/bottomnavbar.dart';
import 'dashboard.dart';
const snackBar1 = SnackBar(content: Text('transaction successful'));
const snackBar2 = SnackBar(content: Text('transaction failed'));


class MakePayment {
  MakePayment({
    required this.ctx,
    required this.price,
    required this.id,

  });

   successResult(BuildContext context){

      if(id == SlotDetail){
        ActivityDb().addActivity(slotPrice: price, );
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Activities()));
        DbHelper().update(pendingBalance:price);
      } else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashBoard()), (route) => false);
        print('no way man');
      }

    }



  BuildContext ctx;
  int price;
  String? id;

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
          method: CheckoutMethod.card,
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



