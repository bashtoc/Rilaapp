import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rila/adminpanel/adminhomepage.dart';
import 'package:rila/adminpanel/movie_tickets_database.dart';

import '../models/constants.dart';
import '../screens/tickets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({Key? key}) : super(key: key);

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late FToast fToast;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  String ticketPrice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        title: const Text(
          'Add ticket',
          style: TextStyle(color: buttonColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 2,
        dismissible: false,
        progressIndicator: const CircularProgressIndicator(
          color: buttonColor,
        ),
        opacity: 0.4,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 22, right: 22),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  height: 118,
                  width: 365,
                  decoration: containerDecoration),
              const SizedBox(
                height: 30,
              ),

              /// ticket price
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value){
                    ticketPrice = value;
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field required';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: ('ticket price'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: buttonColor,
                    ),
                    child: const Text(
                      'add ticket',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttonColor, onPrimary: buttonColor),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {

                         MovieDbHelper().tick(ticketPrice:ticketPrice as int);
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>const AdminPanel()), (route) => false);
                        // something happens when its pressed
                      } on FirebaseAuthException catch (error) {
                        fToast.showToast(
                          toastDuration: const Duration(seconds: 4),
                          child: Material(
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.face),
                                Text(
                                  error.message.toString(),
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 16.0),
                                )
                              ],
                            ),
                          ),
                          gravity: ToastGravity.TOP,
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                    // something happens when its pressed

                    ///on pressed feature
                  }),

              const SizedBox(
                height: 30,
              ),

              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Tickets()));
                  },
                  child: const Text(
                    'See listed tickets',
                    style: TextStyle(color: buttonColor),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
