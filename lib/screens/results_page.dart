import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/constants.dart';





class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

final Uri _url = Uri.parse('https://flutter.dev');
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

String formattedDate = DateFormat.yMMMd().format(DateTime.now());

TextStyle styler2 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.black87.withOpacity(0.6));

bool reject = false;
bool approve = false;
class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'See results',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 250,
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 70.0,
                spreadRadius: 0.0,
                offset:
                    const Offset(0.0, 10.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87.withOpacity(0.5)),
                      ),
                      Row(
                        children: [
                          Text(
                            'Order:',
                            style: styler2,
                          ),
                          Text(' 300 Youtube subscribers',
                              style: styler2.copyWith(
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 50, child: Image.asset('assets/youtube.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: #50',
                    style: styler2,
                  ),
                   SizedBox(
                    height: 30,
                    child: TextButton(

                      onPressed: _launchUrl,
                      child: Text(_url.toString()),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price: #4,000',
                    style: styler2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: styler2,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: const Text(
                          'In review',
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          color: buttonColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: styler2,
                      ),
                      Text('All gender',
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Religion',
                        style: styler2,
                      ),
                      Text('All religions',
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal)),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: styler2,
                      ),
                      Text(
                        'All Nigerian',
                        style: styler2.copyWith(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Allocated',
                        style: styler2,
                      ),
                      Text(
                        '200',
                        style: styler2.copyWith(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'success',
                        style: styler2,
                      ),
                      Text('400',
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 160,
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 70.0,
                spreadRadius: 0.0,
                offset:
                    const Offset(0.0, 10.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: buttonColor,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate,
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal)),
                      Text(
                        'Omobola michael',
                        style: styler2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status',
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal)),
                      Text(
                        'uploaded',
                        style: styler2.copyWith(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20,height: 20, child: Image.asset('assets/youtube.png')),
                          Text('Username',
                              style:
                                  styler2.copyWith(fontWeight: FontWeight.normal)),
                        ],
                      ),
                      const Text('okonkwo owo'),
                    ],
                  ),
                  const SizedBox(width: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Proof of task',
                          style:
                              styler2.copyWith(fontWeight: FontWeight.normal)),
                      Text('click to view',
                          style: styler2.copyWith(color: buttonColor)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children:  [
                GestureDetector(

                    onTap:reject? null: (){
                     showAlertDialog(context);
                    },
                    child: Row(
                      children: [ reject? Text('Rejected',style: styler2.copyWith(color: buttonColor)) : Text('Reject',style: styler2.copyWith(color: buttonColor)),
                        const Icon(Icons.cancel, size: 20, color: Colors.red, ),
                      ],
                    )),
                  const SizedBox(width: 30,),
                Row(
                  children:  [

                    GestureDetector(
                        onTap: approve? null :(){
                          showAlertDialog2(context);
                        },
                        child: Row(
                          children:  [
                            approve? const Text('Approved', style: TextStyle(color: Colors.green),) :const Text('Approve', style: TextStyle(color: Colors.green),) ,

                            const Icon( (Icons.heart_broken_sharp),size: 20, color: Colors.green,),
                          ],
                        ))
                  ],
                ),
              ],)
            ],
          ),
        )
      ]),
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel", style: TextStyle(color: Colors.red),),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue", style: TextStyle(color: Colors.green)),
      onPressed:   () {
        setState(() {
          reject = true;
          approve =false;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Review received')));
        });
        Navigator.pop(context);
      } ,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Review"),
      content: const Text("Are you sure you want to reject this users work?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialog2(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel", style: TextStyle(color: Colors.red),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue", style: TextStyle(color: Colors.green)),
      onPressed:  () {
        setState(() {
          approve = true;
          reject =false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Review received')));
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Review"),
      content: const Text("Are you sure you want to approve this users work?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


