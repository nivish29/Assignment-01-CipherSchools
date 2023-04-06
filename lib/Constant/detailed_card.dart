import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detailedCard extends StatefulWidget {
  double width, imgHeight;
  String image, tag, topic, subtitle1, subtitle2, companyName, companyTag;

  detailedCard(
      {Key? key,
      required this.image,
      required this.width,
      required this.imgHeight,
      required this.tag,
      required this.topic,
      required this.subtitle1,
      required this.subtitle2,
      required this.companyName,
      required this.companyTag})
      : super(key: key);

  @override
  State<detailedCard> createState() => _detailedCardState();
}

class _detailedCardState extends State<detailedCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: widget.width,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff252c36).withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.2,
            blurRadius: 4,
            // offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              widget.image,
              height: widget.imgHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff4902e).withOpacity(0.12),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 6, left: 10.0, right: 10, bottom: 6),
                child: Text(
                  widget.tag,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xfff4902e).withOpacity(0.7), fontSize: 12),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 10.0, right: 10),
                child: Text(
                  widget.topic,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 10.0, right: 10),
                child: Text(
                  widget.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 12),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10.0, right: 10),
                child: Text(
                  widget.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10.0, right: 10),
                          child: Text(
                            widget.companyName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10.0, right: 10),
                          child: Text(
                            widget.companyTag,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
          // Padding(
          //   padding: EdgeInsets.all(16),
          //   child: Text(
          //     'Lorem ipsumr nibh id malesuada dictum.',
          //     textAlign: TextAlign.justify,
          //   ),
          // ),
        ],
      ),
    );
  }
}
