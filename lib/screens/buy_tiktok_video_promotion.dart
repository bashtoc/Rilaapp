import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rila/screens/paystackgateway.dart';

import '../models/constants.dart';


class BuyMusicPromo extends StatefulWidget {
  const BuyMusicPromo({Key? key}) : super(key: key);

  @override
  _BuyMusicPromoState createState() => _BuyMusicPromoState();
}
int? followNumber;
int? amount;
bool initialAmount = false;
String? newAmount;
String socialMediaLink ='';

String  currency(context) {

  var format = NumberFormat().simpleCurrencySymbol('NGN');
  return format;
}

final value = NumberFormat("#,##0.00", "en_US");
var formatter = NumberFormat('#,##,000');

String dropDownValue = 'Tiktok';
var items = [
  'Tiktok',
];
String dropDownValue2 = 'All Religion';
var items2 = [
  'All Religion',
  'Christians',
  'Muslims',
  'Secular',
];
String dropDownValue3 = 'All gender';
var items3 = [
  'All gender',
  'Male',
  'Female',
];


String dropDownValue4 = 'All Nigerians';
var items4 = [
  'All Nigerians',
  'Abia State',
  'Adamawa State',
  'Anambra State',
  'Bauchi State',
  'Bayelsa State',
  'Benue State',
  'Borno State',
  'Cross River State',
  'Delta State',
  'Ebonyi State',
  'Edo State',
  'Ekiti State',
  'Enugu State',
  'Gombe State',
  'Imo State',
  'Jigawa State',
  'Kaduna State',
  'Kano State',
  'Katsina State',
  'Kebbi State',
  'Kogi State',
  'Kwara State',
  'Lagos State',
  'Nasarawa State',
  'Niger State',
  'Ogun State',
  'Ondo State',
  'Osun State	',
  'Oyo State',
  'Plateau State',
  'Rivers State',
  'Sokoto State',
  'Taraba State',
  'Yobe State',
  'Zamfara State',
  'Fct Abuja',
];




TextStyle  styler =   TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black87.withOpacity(0.7));

String tweeter = 'assets/tiktok.png';


class _BuyMusicPromoState extends State<BuyMusicPromo> {
  @override
  Widget build(BuildContext context) {
    int amount = 500;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Promote on Tiktok videos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Promote your music or product on tiktok, tiktok users will make a video with your music or product.', style: styler,),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Platform',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black54),),
                  const SizedBox(width: 10,),
                  const SizedBox(height: 20,),

                  SizedBox(
                      height: 40,
                      child: Image.asset(tweeter)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    followNumber = int.parse(value);

                    setState(() {
                      initialAmount = true;
                      newAmount = (followNumber! * amount).toString();
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid number';
                    }

                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: ktextfield.copyWith(
                    labelText: 'how many shares do you want?',
                    hintText: 'how many followers do you want?',
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xffC55E14), width: 1.0),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: movieContainerDecoration.copyWith(),
                child: Row(
                  children: [
                    const Text('    You will pay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black54),),
                    const SizedBox(
                      width: 7,
                    ),
                    initialAmount? Text('${currency(context)}${value.format(
                        int.parse(newAmount!))}',  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),) : const Text('')
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 20,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Social Platform',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: movieContainerDecoration.copyWith(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value!;

                            });
                          },
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: dropDownValue,
                          hint: const Text('select platform'),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            'This feature is only available on tiktok platform'),

                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Religion',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: movieContainerDecoration.copyWith(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              dropDownValue2 = value!;
                            });
                          },
                          items: items2
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: dropDownValue2,
                          hint: const Text('Select Religion'),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            'You can target the kind of people you want promote your Music or Product by religion, you can select all religion for everyone'),

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Gender',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: movieContainerDecoration.copyWith(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              dropDownValue3 = value!;
                            });
                          },
                          items: items3
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: dropDownValue3,
                          hint: const Text('Select Gender'),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            'You can target the gender of people you want to promote your music or product or select all gender for everyone'),

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: movieContainerDecoration.copyWith(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              dropDownValue4 = value!;
                            });
                          },
                          items: items4
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: dropDownValue4,
                          hint: const Text('select location'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                        'You can target the kind of people you want to Promote your Music or product by location, you can select a particular state or all Nigerians for everyone'),

                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(

                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        socialMediaLink = value;

                        setState(() {
                          initialAmount = true;
                          newAmount = (followNumber! * amount).toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid link';
                        }

                        return null;
                      },

                      textAlign: TextAlign.center,
                      decoration: ktextfield.copyWith(
                        prefixIcon: const Icon( Icons.link_rounded,),
                        labelText: 'Enter your post or page Url or link',
                        hintText: 'Enter your post or page Url or link?',
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffC55E14), width: 1.0),
                        ),
                      )),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            'please enter the url or link to your music or product description, make sure you copy it with https://'),

                      ],
                    ),
                  ),
                ],
              ), const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: const Color(0xffC55E14),
                child: TextButton(
                    onPressed: () {
                      makePayment(context);
                      // MakePayment(
                      //   price: 60,
                      //   ctx: context,    )
                      //     .chargeCardAndMakePayment();
                    },
                    child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Proceed to pay ${currency(context)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          initialAmount? Text(value.format(int.parse(newAmount!)), style: const TextStyle(color: Colors.white),): const Text('')
                        ]
                    )),
              ),
              const SizedBox(height: 70,)
            ],
          ),
        ),
      ),
    );
  }
}
