import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  String Topic, Subtopic;
  HomeCard({Key? key, required this.Topic, required this.Subtopic})
      : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12),
      height: 260,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff353942),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Stack(children: [
                  Image.asset(
                    'assets/tag.png',
                  ),
                  Positioned(
                      left: 73,
                      top: 55,
                      child: Text(
                        'Free',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 180,
              child: Text(
                widget.Topic,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 30),
          //   child: Text(
          //     'Content',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 28),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
            child: Text(
              widget.Subtopic,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
// 353942
