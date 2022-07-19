import 'package:flutter/material.dart';


// this is the decoration for sign up text form fields
const ktextfield = InputDecoration(

  hintText: 'Enter your phone number',
  labelText: 'Phone',
  labelStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
  ),
  hintStyle: TextStyle(color: Colors.black38),
  enabledBorder: OutlineInputBorder(
    // borderSide: BorderSide(
    //   color: Colors.green,
    // ),
  ),
  focusedBorder: OutlineInputBorder(

    borderSide:
    BorderSide(color:Color(0xffC55E14), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),


  ),
);


// this is the buttons color
const buttonColor = Color(0xffC55E14);

// this is the decoration for the container in dashboard
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


