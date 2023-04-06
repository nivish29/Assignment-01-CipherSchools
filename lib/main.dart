import 'package:cipher_project/slider_course.dart';
import 'package:flutter/material.dart';

import 'NavBarPage.dart';
import 'carouselSlider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // theme: ThemeData.dark(),
      home: NavbarPage(),
      // home: CarouselSliderWithButtons(
      //   items: [
      //     Container(color: Colors.red),
      //     Container(color: Colors.green),
      //     Container(color: Colors.blue),
      //   ],
      // ),
      // home: CarouselSlider(),
    );
  }
}
