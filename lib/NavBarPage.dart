import 'package:cipher_project/Trending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'CourseScreen.dart';
import 'HomeScreen.dart';
import 'Profile.dart';

class NavbarPage extends StatefulWidget {
  NavbarPage({Key? key}) : super(key: key);

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int pageIndex = 0;
  Color _backgroundColor = Colors.white;
  Color x = Colors.black;
  Color unselectedColor = Colors.black;
  final List<Widget> items = [
    HomePage(),
    CoursePage(),
    Trending(),
    Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _backgroundColor = Colors.white;
    x = Colors.black;
    unselectedColor = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          items.elementAt(pageIndex),
          Align(
            alignment: Alignment(0.0, 0.96),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.063),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: x.withOpacity(0.10), blurRadius: 10),
                ], borderRadius: BorderRadius.circular(35)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Color(0xfff19232),
                    unselectedItemColor: unselectedColor,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    backgroundColor: _backgroundColor,
                    // backgroundColor: Color(0xff151821),
                    currentIndex: pageIndex,
                    onTap: (int index) {
                      setState(() {
                        pageIndex = index;
                        if (pageIndex == 0) {
                          _backgroundColor = Colors.white;
                          x = Colors.black;
                          unselectedColor = Colors.black;
                        }
                        if (pageIndex == 1) {
                          _backgroundColor = Color(0xff151821);
                          x = Colors.white;
                          unselectedColor = Colors.white;
                        }
                        if (pageIndex == 2) {
                          _backgroundColor = Colors.white;
                          x = Colors.black;
                          unselectedColor = Colors.black;
                        }
                        if (pageIndex == 3) {
                          _backgroundColor = Colors.white;
                          x = Colors.black;
                          unselectedColor = Colors.black;
                        }
                      });
                    },
                    // iconSize: 23,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu_book_sharp), label: "Courses"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.trending_up_outlined),
                          label: 'Trending'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.supervisor_account_rounded),
                          label: "Profile"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 12),
      //     child: Container(
      //       height: 63,
      //       padding: EdgeInsets.all(12),
      //       margin: EdgeInsets.symmetric(horizontal: 20),
      //       decoration: BoxDecoration(boxShadow: [
      //         BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 20)
      //       ], color: Colors.black, borderRadius: BorderRadius.circular(35)),
      //     ),
      //   ),
      // ),
    );
  }
}
