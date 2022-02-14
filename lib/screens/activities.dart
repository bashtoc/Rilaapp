import 'package:flutter/material.dart';
import 'package:rila/classes/Activities_class.dart';
import 'package:rila/classes/movie_class.dart';

class Activities extends StatelessWidget {
  Activities({Key? key}) : super(key: key);
  static String id = 'activities_Screen';

  final List<MoviesDashboard> moviesDashboard = [
    MoviesDashboard(
        movieName: 'Witches Den',
        movieType: 'Series',
        productionCost: 120000.0,
        slotPrice: 4000.0)
  ];




  final List<ActivitiesHistory> activitiesHistory = [
    ActivitiesHistory(
      description: 'withdrawal description',
      amount: 24345.0,
      depositIcon: 'deposit image',
      withdrawIcon: 'withdrawIcon',
      slots: 12,
      due: '12 april 22',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  const Icon(Icons.arrow_back,
          color: Colors.black,
          ), onPressed: () {
            Navigator.pop(context);
        },
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Activities',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieName),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(moviesDashboard[index].movieType),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Slots',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].slots.toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(activitiesHistory[index].due.toString()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
          itemCount: activitiesHistory.length),
    );
  }
}
