
import 'package:flutter/material.dart';
import 'package:rila/classes/movie_class.dart';
import 'package:rila/models/constants.dart';
import '../models/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  static const String id = 'DashBoard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<MoviesDashboard> moviesDashboard = [
    MoviesDashboard(
        movieName: 'Witches Den',
        movieType: 'Series',
        productionCost: 120000.0,
        slotPrice: 4000.0)
  ];

  @override
  Widget build(BuildContext context) {
    String moviesBanner = 'assets/moviesBanner.jpeg';

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Movie Slots',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body:
       ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 23, right: 23),
                decoration: movieContainerDecoration,
                child: Column(
                  children: [
                    Image.asset(moviesBanner),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold,

                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                moviesDashboard[index].movieName,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Slot price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                  moviesDashboard[index].slotPrice.toString(),)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: buttonColor,
                            ),
                            onPressed: () {
                              // something happens when pressed *//
                            },
                            child: const Text(
                              'Buy slot',
                              style: TextStyle(color: Colors.white),

                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              //another hard coded list
              Container(
                margin: const EdgeInsets.only(left: 23, right: 23),
                decoration: movieContainerDecoration,
                child: Column(
                  children: [
                    Image.asset(moviesBanner),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold,

                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                moviesDashboard[index].movieName,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Slot price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                moviesDashboard[index].slotPrice.toString(),)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: buttonColor,
                            ),
                            onPressed: () {
                              // something happens when pressed *//
                            },
                            child: const Text(
                              'Buy slot',
                              style: TextStyle(color: Colors.white),

                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: moviesDashboard.length,
      ),
    );
  }
}
