import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipher_project/model/HomeCardModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

import 'Constant/Card_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List HomeCardEntries = [
    HomeCardModel(
        'Q-rated Content', 'Unlock quality content with our Q-rated content!'),
    HomeCardModel('Projects',
        'Get the hands-on experience with real-time projects guided by expert mentors!'),
    HomeCardModel('Mentors',
        'Start learning from mentors comming from giant corporation like Microsoft, Google, Amazon, Paypal, etc!')
  ];

  late Gallery3DController controller;
  @override
  void initState() {
    controller = Gallery3DController(
        itemCount: 10, autoLoop: true, ellipseHeight: 0, minScale: 0.4);
    super.initState();
  }

  Widget buildAnimatedText() => AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            ' absolutely Free ',
            textStyle: const TextStyle(
                color: Color(0xfff98f1e),
                fontWeight: FontWeight.normal,
                fontSize: 20.5),
            speed: Duration(milliseconds: 140),
          )
        ],
        repeatForever: true,
        pause: Duration(milliseconds: 600),
      );

  int currentIndex = 0;

  Widget buildGallery3D() {
    return Gallery3D(
        controller: controller,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        width: MediaQuery.of(context).size.width,
        height: 500,
        isClip: false,

        // ellipseHeight: 80,
        // currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        itemConfig: GalleryItemConfig(
            width: 300,
            height: 500,
            radius: 10,
            isShowTransformMask: true,
            shadows: [
              BoxShadow(
                  color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
            ]),
        onClickItem: (index) => print("currentIndex:$index"),
        itemBuilder: (context, index) {
          return Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff353942),
            ),
            child: Image.asset('assets/a1.png'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12, right: 7),
            child: Image.asset(
              'assets/menu.png',
              width: 40,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
        title: const Text(
          'CipherSchools',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.095,
            ),
            screenWidth > 380
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            color: Color(0xff212121),
                            fontWeight: FontWeight.bold,
                            fontSize: 37),
                      ),
                      Text(
                        ' The',
                        style: TextStyle(
                            color: Color(0xfff98f1e),
                            fontWeight: FontWeight.bold,
                            fontSize: 37),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            color: Color(0xff212121),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        ' The',
                        style: TextStyle(
                            color: Color(0xfff98f1e),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
            SizedBox(
              height: screenHeight * 0.0095,
            ),
            screenWidth > 380
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Future',
                        style: TextStyle(
                            color: Color(0xfff98f1e),
                            fontWeight: FontWeight.bold,
                            fontSize: 37),
                      ),
                      Text(
                        ' of Learning!',
                        style: TextStyle(
                            color: Color(0xff212121),
                            fontWeight: FontWeight.bold,
                            fontSize: 37),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Future',
                        style: TextStyle(
                            color: Color(0xfff98f1e),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        ' of Learning!',
                        style: TextStyle(
                            color: Color(0xff212121),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Start Learning by best creators for',
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontWeight: FontWeight.normal,
                        fontSize: 20.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0095,
            ),
            buildAnimatedText(),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                ' ',
                style: TextStyle(
                    color: Color(0xfff98f1e),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 50,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage('assets/a1.png')),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage('assets/a2.png')),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage('assets/a3.png')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        '50+',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Mentors',
                      style: TextStyle(
                        color: Color(0xff696969),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.4),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '4.8/5',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.asset(
                              'assets/star.png',
                              width: 16,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset(
                            'assets/halfstar.png',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Ratings',
                            style: TextStyle(
                              color: Color(0xff696969),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )

                    // Text(
                    //   Image,
                    //   style: TextStyle(
                    //     color: Color(0xff696969),
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.055,
            ),
            Container(
              width: screenWidth * 0.57,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xfff4902e)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Learning Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/arrow.png',
                      width: 30,
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            CarouselSlider.builder(
              itemCount: HomeCardEntries.length,
              options: CarouselOptions(
                  height: 270,
                  enlargeFactor: 0.20,
                  disableCenter: true,
                  aspectRatio: 16 / 9,
                  // padEnds: false,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 1)),
              itemBuilder: (context, index, realIndex) {
                return HomeCard(
                  Topic: HomeCardEntries[index].Topic,
                  Subtopic: HomeCardEntries[index].Subtopic,
                );
              },
            ),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
