import 'package:flutter/material.dart';
import '../screens/profile.dart';
import '../screens/home.dart';
import '../screens/dashboard.dart';


class BottomNavBar extends StatefulWidget {
   static const String id = 'bottomNavBar';
  BottomNavBar({Key? key,}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();

  final List<Widget> screens = [
     const Home(firstName: '',),
     const DashBoard(),
          const Profile(),
  ];
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =  const Home(firstName: '',);
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(
                        () {
                      currentScreen =   const Home(firstName: '',);
                      currentTab = 0;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 25.0,
                      color: currentTab == 0 ? const Color(0xffE73030) : Colors.grey,
                    ),
                    Text(
                      'home',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentTab == 0 ? const Color(0xffE73030) : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(

                minWidth: 40,
                onPressed: () {
                  setState(
                        () {
                      currentScreen = const DashBoard();
                      currentTab = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.dashboard,
                      size: 25,
                      color: currentTab == 1 ? const Color(0xffE73030) : Colors.grey,
                    ),
                    Text(
                      'dash board',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentTab == 1 ? const Color(0xffE73030) : Colors.grey,
                      ),
                    )
                  ],
                ),),
               // ),MaterialButton(
              //   minWidth: 40,
              //   onPressed: () {
              //     setState(
              //           () {
              //         currentScreen =   const Cards();
              //         currentTab = 2;
              //       },
              //     );
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Icon(
              //         Icons.branding_watermark_rounded,
              //         size: 25.0,
              //         color: currentTab == 2 ? const Color(0xffE73030) : Colors.grey,
              //       ),
              //       Text(
              //         'cards',
              //         style: TextStyle(
              //           fontSize: 10,
              //           color: currentTab == 2 ? const Color(0xffE73030) : Colors.grey,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(
                        () {
                      currentScreen =  Profile();
                      currentTab = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 25.0,
                      color: currentTab == 2 ? const Color(0xffE73030) : Colors.grey,
                    ),
                    Text(
                      'profile',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentTab == 2 ? const Color(0xffE73030) : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






