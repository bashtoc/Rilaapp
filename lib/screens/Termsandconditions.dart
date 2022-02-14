import 'package:flutter/material.dart';


class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Terms and conditions', style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Text('')
          ],
        ),
      ),
    );
  }
}
