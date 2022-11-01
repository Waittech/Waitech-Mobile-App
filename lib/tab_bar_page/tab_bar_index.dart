import 'package:flutter/material.dart';
import 'package:waitech/tab_bar_page/profile.dart';
import 'package:waitech/tab_bar_page/qr_code.dart';

import '../screens/Home/home_screen.dart';
import '../screens/basket/basket_screen.dart';

class TabBarIndex extends StatefulWidget {
  static const String routeName = '/tab_bar_index';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => TabBarIndex(),
        settings: RouteSettings(name: routeName));
  }

  const TabBarIndex({super.key});

  @override
  State<TabBarIndex> createState() => _TabBarIndexState();
}

class _TabBarIndexState extends State<TabBarIndex> {
  int currentTab = 0;

  final List<Widget> screen = [Profile(), QrCode(), BasketScreen()];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/qr_code');
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.qr_code_2,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      MaterialButton(
                        minWidth: 60,
                        onPressed: () {
                          setState(() {
                            currentScreen = HomeScreen();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: currentTab == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('Home',
                                style: TextStyle(
                                  color: currentTab == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorLight,
                                  fontSize: 9,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        minWidth: 60,
                        onPressed: () {
                          setState(() {
                            //currentScreen = Profile();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.question_answer,
                              color: currentTab == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('?',
                                style: TextStyle(
                                  color: currentTab == 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorLight,
                                  fontSize: 9,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ), //left
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 60,
                        onPressed: () {
                          setState(() {
                            currentScreen = BasketScreen();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_basket,
                              color: currentTab == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('Sepet',
                                style: TextStyle(
                                  color: currentTab == 2
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorLight,
                                  fontSize: 9,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        minWidth: 60,
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: currentTab == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text('Profil',
                                style: TextStyle(
                                  color: currentTab == 3
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorLight,
                                  fontSize: 9,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ), //right
                ]),
          )),

      // body: Center(
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //         backgroundColor: Theme.of(context).primaryColor),
      //     child: Text('Location Screen',
      //         style: Theme.of(context)
      //             .textTheme
      //             .titleMedium
      //             ?.copyWith(color: Colors.white)),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/location');
      //     },
      //   ),
      // ),
    );
  }
}
