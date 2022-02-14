
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:rila/classes/paystackkey.dart';
const snackBar1 = SnackBar(content: Text('transaction successful'));
const snackBar2 = SnackBar(content: Text('transaction failed'));


class MakePayment {
  MakePayment({
    required this.ctx,
    required this.price,
  });

  BuildContext ctx;
  dynamic price;

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

  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = (price * 100) as int
        ..email = 'vowsnig@gmail.com'
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await payStack.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: Image.asset(
            'assets/rila logo.png',
            height: 30,
            width: 30,
          ));
      if (response.status == true) {

        // ScaffoldMessenger.of(ctx).showSnackBar(snackBar1);
        //print('transaction was successful');
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(snackBar2);

        // print('Transaction Failed',);
      }
    });
  }

}


