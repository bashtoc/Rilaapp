import 'dart:io';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rila/adminpanel/adminhomepage.dart';
import 'package:rila/models/constants.dart';
import 'package:rila/screens/social_earn.dart';

import '../screens/personal_details.dart';
import 'movie_tickets_database.dart';

class ListMoviePage extends StatefulWidget {
  const ListMoviePage({Key? key}) : super(key: key);

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int slotPrice =0;
  String? movieName;
  String? dueDate;
  String? streamingPlatform;
  int? percentageInterest;
  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

bool isLoading = false;
  PlatformFile? pickedFile;
  File? fileToDisplay;
  String? fileName;
  File? file;




  bool displayFile = false;
  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.image,);
    if(result == null) return;
    final path = result.files.single.path!;
    fileName = result.files.first.name;
    pickedFile = result.files.first;
    fileToDisplay = File(pickedFile!.path.toString());
    setState(() {
      file = File(path);
      displayFile = true;
    });
  }



  UploadTask? uploadTask;

DateTimeRange dateRange = DateTimeRange(start: DateTime(2022,06,20), end: DateTime(2022,12,30));




  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    // int differences = difference as int;

    // Future.delayed( Duration(days: differences), () {});


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
          'List movie',
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
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        child:  displayFile? Image.file(fileToDisplay!): IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            selectFile();
                            displayFile = true;
                          },
                        ),
                        height: 118,
                        width: 365,
                        decoration: containerDecoration),
                    const SizedBox(
                      height: 30,
                    ),

                    /// movie name
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        movieName = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: ('movie name'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ///due date
                   const Text('Select duration'),

                   Row(
                     children: [
                       Expanded(
                         child: TextButton(
                           child:  Container(
                             padding: const EdgeInsets.all(10),
                               color: buttonColor,
                               child: Text(DateFormat.yMMMd().format(start), style: const TextStyle(color: Colors.white),)),
                           onPressed: (){
                             pickDateRange();
                           },
                         ),
                       ),
                       const SizedBox(width: 20,),
                       Expanded(
                         child: TextButton(
                           child:  Container(
                               padding: const EdgeInsets.all(10),
                               color: buttonColor,
                               child: Text(DateFormat('dd/MM/yyyy').format(end),style: const TextStyle(color: Colors.white),)),
                           onPressed: (){
                             pickDateRange();
                           },
                         ),
                       ),

                     ],
                   ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Duration: ${difference.inDays} days', style: const TextStyle(fontSize: 16),),



                    const SizedBox(
                      height: 30,
                    ),

                    ///percentage Interest
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        percentageInterest = int.parse(value);
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: ('percentage Interest'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    /// slot price
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        slotPrice = int.parse(value);
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: ('slot price'),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    ///streaming platform
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        streamingPlatform = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: ('streaming Platform'),
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
                          'list movie',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: buttonColor, onPrimary: buttonColor),


                      /// upload button for list movie
                      onPressed: () async {
                        if (_formKey.currentState!.validate()   ) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final path = 'files${pickedFile!.name}';
                            final file = File(pickedFile!.path!);
                            final ref = FirebaseStorage.instance.ref().child(path);
                            uploadTask = ref.putFile(file);
                            final snapshot = await uploadTask!.whenComplete((){});
                            String urlDownload = await snapshot.ref.getDownloadURL();
                            await MovieDbHelper().slots(
                              movieName: movieName,
                              slotPrice: slotPrice,
                              dueDate: DateFormat.jm().format(end),
                              percentageInterest: percentageInterest,
                              streamingPlatform: streamingPlatform,
                              movieBanner: urlDownload,

                            );

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AdminPanel()),
                                (route) => false);
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
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SocialEarn()));
                        },
                        child: const Text(
                          'See listed movies',
                          style: TextStyle(color: buttonColor),
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }



  Future pickDateRange() async{
      DateTimeRange? newDateRange = await showDateRangePicker(context: context,initialDateRange: dateRange, firstDate:DateTime(1900), lastDate: DateTime(2100));
      if(newDateRange == null) return 'date cancelled';
      setState(() {
        dateRange = newDateRange;
      });
  }
}




