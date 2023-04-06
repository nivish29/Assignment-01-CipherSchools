import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown1 extends StatefulWidget {
  double width, height, opacity;
  String selectedCategory;
  List<String> Category;
  Dropdown1(
      {Key? key,
      required this.width,
      required this.height,
      required this.opacity,
      required this.selectedCategory,
      required this.Category})
      : super(key: key);

  @override
  State<Dropdown1> createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff5D6A78).withOpacity(widget.opacity),
        ),
        child: DropdownButtonFormField(
          value: widget.selectedCategory,
          items: widget.Category.map((e) => DropdownMenuItem(
                child: Text(
                  e,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                value: e,
              )).toList(),
          onChanged: (val) {
            setState(() {
              widget.selectedCategory = val as String;
            });
          },
          dropdownColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              left: 15,
              bottom: 7,
            ),
          ),
        ),
      ),
    );
  }
}
