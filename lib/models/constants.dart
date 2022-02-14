import 'package:flutter/material.dart';


// this is the decoration for sign up text form fields
const ktextfield = InputDecoration(
  hintText: 'Enter your phone number',
  labelText: 'Phone',
  labelStyle: TextStyle(
    color: Colors.black38,
    fontSize: 18,
  ),
  hintStyle: TextStyle(color: Colors.black38),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
);


// this is the buttons color
const buttonColor = Color(0xff721C09);

// this is the devoration for the container in dashboard
const movieContainerDecoration = BoxDecoration(
  border: Border(
    right: BorderSide(
      color: Colors.black54,
      width: 1.0,
    ),
    bottom: BorderSide(
      color: Colors.black54,
      width: 1.0,
    ),
    top: BorderSide(
      color: Colors.black54,
      width: 1.0,
    ),
    left: BorderSide(
      color: Colors.black54,
      width: 1.0,
    ),
  ),
);

final containerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: const Border(
    top: BorderSide(color: Colors.black12, width: 1.0),
    bottom: BorderSide(color: Colors.black12, width: 1.0),
    left: BorderSide(color: Colors.black12, width: 1.0),
    right: BorderSide(color: Colors.black12, width: 1.0),
  ),
);

const textfieldstyler = TextStyle(fontSize: 17);