import 'package:cipher_project/Constant/dropdown.dart';
import 'package:cipher_project/model/cardModel.dart';
import 'package:cipher_project/slider_course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Constant/CourseCard.dart';
import 'Constant/detailed_card.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List cardEntries = [
    CardModel(
        'assets/courseImage/d1.jpg',
        'Languify',
        'FREE IELTS/TOEFL MOCK Assesment',
        'AI generated feedback and scores',
        'Test Duration: 30 mins / 3 hours',
        'Languify',
        'express & excel'),
    CardModel(
        'assets/courseImage/d2.jpg',
        'Web Development',
        'Web Development',
        'No. of videos: 138',
        'Course time: 21.8 hours',
        'Harshit Vashisth',
        'Instructor'),
    CardModel(
        'assets/courseImage/d3.jpg',
        'Programming',
        'Basics of Python',
        'No. of videos: 57',
        'Course time: 10.2 hours',
        'Fun with data science',
        'Instructor')
  ];

  final Category = ["Popular", "General", "On Choice"];
  String? selectedCategory = "Popular";
  String selectedValue = "Browse";
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    // print(cardEntries[0].tag);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151821),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: DropdownButton<String>(
              value: selectedValue,
              dropdownColor: Colors.black,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white.withOpacity(0.9),
              ),
              underline: Container(
                height: 0,
              ),
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Browse',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 14),
                  ),
                  value: 'Browse',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Option 2',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 14),
                  ),
                  value: 'Option 2',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Option 3',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 14),
                  ),
                  value: 'Option 3',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ),
          Row(
            children: [
              Switch(
                value: isSwitched,
                activeThumbImage: AssetImage('assets/m1.png'),
                inactiveThumbImage: AssetImage('assets/sun.png'),
                activeColor: Colors.grey.withOpacity(0.5),
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12, right: 3),
              child: Icon(Icons.notifications_none)),
          Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12, right: 3),
              child: Icon(Icons.search_rounded)),
        ],
        backgroundColor: Color(0xff272b36),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
        title: Text(
          'CipherSchools',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              CarouselSliderWithButtons(
                items: [
                  CourseCard(
                    image: 'assets/courseImage/c1.jpg',
                    title: 'Full-stack Development using MERN',
                    backText: 'WEB DEVELOPMENT WITH MERN',
                    buttonText: 'Web Development',
                  ),
                  CourseCard(
                    image: 'assets/courseImage/c2.jpg',
                    title: 'Full-stack Development using FLUTTER',
                    backText: 'BUILD YOUR IDEAS TO LIFE | FLUTTER',
                    buttonText: 'Android Development',
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.042,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Recommended Courses',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(1)),
                    ),
                  ),
                  Dropdown1(
                      height: 42,
                      width: 100,
                      opacity: 0.4,
                      selectedCategory: selectedCategory.toString(),
                      Category: Category)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              screenHeight > screenWidth
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 5, right: 5),
                      child: Container(
                        height: screenHeight * 0.35,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cardEntries.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: detailedCard(
                                  width: screenWidth / 2.180,
                                  imgHeight: 125,
                                  image: cardEntries[index].image,
                                  tag: cardEntries[index].tag,
                                  topic: cardEntries[index].topic,
                                  subtitle1: cardEntries[index].subtitle1,
                                  subtitle2: cardEntries[index].subtitle2,
                                  companyName: cardEntries[index].companyName,
                                  companyTag: cardEntries[index].companyTag,
                                ),
                              );
                            }),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        height: screenHeight * 0.9,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cardEntries.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: detailedCard(
                                  width: 300,
                                  imgHeight: 160,
                                  image: cardEntries[index].image,
                                  tag: cardEntries[index].tag,
                                  topic: cardEntries[index].topic,
                                  subtitle1: cardEntries[index].subtitle1,
                                  subtitle2: cardEntries[index].subtitle2,
                                  companyName: cardEntries[index].companyName,
                                  companyTag: cardEntries[index].companyTag,
                                ),
                              );
                            }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
